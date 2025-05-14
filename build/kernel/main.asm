org 0x0
bits 16


%define ENDL 0x0D, 0x0A


start:
    mov ah, 0x06
    mov al, 0
    mov bh, 0x07
    mov cx, 0
    mov dx, 0x184F
    int 0x10

    mov ah, 0x02
    mov bh, 0x00
    mov dh, 0x00
    mov dl, 0x00
    int 0x10

    mov si, msg_hello
    call puts

.halt:
    cli
    hlt

puts:
    push si
    push ax
    push bx

.loop:
    lodsb               
    or al, al          
    jz .done

    mov ah, 0x0E        
    mov bh, 0           
    int 0x10

    jmp .loop

.done:
    pop bx
    pop ax
    pop si    
    ret

msg_hello: db 'Hello world from kernel!', ENDL, 0
