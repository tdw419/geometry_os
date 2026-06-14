; Boot sector that writes pixel patterns to disk sectors
; Every sector write appears as pixels on the GeoOS canvas
; Every disk block write becomes a pixel on the canvas via FUSE
;
; Assemble: nasm -f bin -o boot_pixel_test.bin boot_pixel_test.asm
; Install:  dd if=boot_pixel_test.bin of=/mnt/memory_palace/pixel_disk.raw conv=notrunc

org 0x7C00
bits 16

start:
    ; Set up segments and stack right after boot sector
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    mov [boot_drive], dl

    ; Print boot message
    mov si, boot_msg
    call print_string

    ; ========================================
    ; Phase 1: Write rainbow patterns to sectors 2-5
    ; Each sector = 512 bytes = 128 pixels on the canvas
    ; ========================================

    ; Use buffer at 0x0600 (above BIOS data area, safe)
    mov word [buf_seg], 0x0000
    mov word [buf_off], 0x0600

    mov byte [sector_num], 2        ; Start at sector 2
    mov cx, 4                       ; Write 4 sectors

.write_loop:
    push cx

    ; Fill buffer at 0x0600 with rainbow pattern
    call fill_buffer

    ; Write sector via INT 13h AH=03h
    mov ah, 0x03        ; Write sectors
    mov al, 1           ; 1 sector
    mov ch, 0           ; Cylinder 0
    mov cl, [sector_num]; Sector
    mov dh, 0           ; Head 0
    mov dl, [boot_drive]; Drive
    mov bx, 0x0600      ; Buffer segment:offset
    int 0x13

    jc .write_err

    ; Print success dot
    mov al, '.'
    mov ah, 0x0E
    int 0x10

    inc byte [sector_num]
    pop cx
    loop .write_loop

    ; Phase 2: Read back sector 2 and show first bytes
    mov si, crlf
    call print_string

    mov ah, 0x02        ; Read sectors
    mov al, 1
    mov ch, 0
    mov cl, 2           ; Sector 2
    mov dh, 0
    mov dl, [boot_drive]
    mov bx, 0x0600
    int 0x13

    jc .read_err

    ; Show first 8 bytes as hex
    mov si, read_msg
    call print_string
    mov bx, 0x0600
    mov al, [bx]
    call print_hex
    mov al, [bx+1]
    call print_hex
    mov al, [bx+2]
    call print_hex
    mov al, [bx+3]
    call print_hex
    mov al, [bx+4]
    call print_hex
    mov al, [bx+5]
    call print_hex
    mov al, [bx+6]
    call print_hex
    mov al, [bx+7]
    call print_hex
    mov si, crlf
    call print_string

.done:
    mov si, done_msg
    call print_string

.halt:
    cli
    hlt
    jmp .halt

.write_err:
    mov si, write_err_msg
    call print_string
    jmp .done

.read_err:
    mov si, read_err_msg
    call print_string
    jmp .done

; Fill buffer at 0x0600 with a rainbow gradient
; Each pixel: 4 bytes (B, G, R, A) — x86 little-endian
; So pixel color = RGBA but stored as B,G,R,A in memory
fill_buffer:
    push ax
    push cx
    push si
    push di

    mov di, 0x0600      ; buffer address
    xor cx, cx          ; pixel index
.fill_pixel:
    ; cx = pixel index (0-127)
    ; Color pattern: R=FF, G=(127-index)*2, B=index*2
    ; So as we move right: B increases, G decreases, R stays max

    ; Blue byte = index * 2 (store at [di])
    mov ax, cx
    shl ax, 1           ; * 2
    mov [di], al        ; B

    ; Green byte = 255 - index*2 (store at [di+1])
    mov ax, 255
    sub ax, cx
    sub ax, cx
    jns .g_ok
    xor ax, ax
.g_ok:
    mov [di+1], al      ; G

    ; Red byte = 255 - index (store at [di+2])
    mov ax, 255
    sub ax, cx
    jns .r_ok
    xor ax, ax
.r_ok:
    mov [di+2], al      ; R

    ; Alpha = 0xFF
    mov byte [di+3], 0xFF

    add di, 4
    inc cx
    cmp cx, 128
    jl .fill_pixel

    pop di
    pop si
    pop cx
    pop ax
    ret

; Print string at DS:SI
print_string:
    push ax
    push si
.loop:
    lodsb
    or al, al
    jz .done_ps
    mov ah, 0x0E
    int 0x10
    jmp .loop
.done_ps:
    pop si
    pop ax
    ret

; Print hex value in AL
print_hex:
    push ax
    push cx
    push dx

    mov ah, al
    shr al, 4
    cmp al, 10
    jb .digit1
    add al, 7
.digit1:
    add al, '0'
    mov ah, 0x0E
    int 0x10

    mov al, ah
    and al, 0x0F
    cmp al, 10
    jb .digit2
    add al, 7
.digit2:
    add al, '0'
    mov ah, 0x0E
    int 0x10

    pop dx
    pop cx
    pop ax
    ret

; Data
boot_drive  db 0
sector_num  db 2
buf_seg     dw 0
buf_off     dw 0x0600

boot_msg    db 'Pixel Disk Boot!', 0x0D, 0x0A
            db 'Writing rainbow pattern to disk...', 0x0D, 0x0A, 0
read_msg    db 'Read back: 0x', 0
done_msg    db 0x0D, 0x0A, 'Done! Halting.', 0x0D, 0x0A, 0
write_err_msg db 'Write err!', 0
read_err_msg  db 'Read err!', 0
crlf        db 0x0D, 0x0A, 0

; Boot signature
times 510-($-$$) db 0
dw 0xAA55
