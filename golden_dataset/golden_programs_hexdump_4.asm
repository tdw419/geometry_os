; DESCRIPTION: This GeOS assembly code reads bytes from a RAM buffer at address 0x6000 and displays them as hexadecimal values on the screen. It counts the number of bytes, converts each byte to its hex representation, formats it into rows of 8 bytes, and then draws the text using `DRAWTEXT`. The total byte count is stored at address 0x7800.

; hexdump.asm -- Hex viewer for RAM contents
;
; Reads bytes from a RAM buffer and displays them as hex values
; on the screen using DRAWTEXT. Demonstrates byte-to-hex conversion.
;
; Input: data at 0x6000 (pre-loaded sample text)
; Output: hex display on screen, byte count at RAM[0x7800]
;
; Format: 8 bytes per row, hex pairs separated by spaces
; e.g. "48 65 6C 6C 6F 20 57 6F" for "Hello Wo"

    ; --- Fill screen ---
    LDI r12, 0x000011
    FILL r12

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r3, 0x6000
    LDI r11, 0             ; byte count

count_loop:
    LOAD r10, r3
    LDI r4, 0
    CMP r10, r4
    JZ r6, count_done
    ADDI r11, 1
    ADDI r3, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r5, 0x7800
    STORE r5, r11

    ; --- Draw header ---
    LDI r12, 0x440044       ; purple header
    LDI r1, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r1, r16, r17, r18, r12

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r3, 4
    LDI r11, 2
    LDI r14, 0x5000
    LDI r8, 0xFFFFFF
    LDI r13, 0x440044
    DRAWTEXT r3, r11, r14, r8, r13

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r11, 16            ; y position
    LDI r0, 14             ; line spacing
    LDI r15, 1
    LDI r2, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r10, r20
    LDI r4, 0
    CMP r10, r4
    JZ r6, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r7, 0xF
    MOV r9, r10
    AND r9, r7             ; low nibble
    ADDI r9, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r5, 10
    CMP r9, r5
    BLT r6, lo_digit_ok
    ADDI r9, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r7, 4
    MOV r5, r10
    SHR r5, r7             ; high nibble
    ADDI r5, 48
    LDI r4, 10
    CMP r5, r4
    BLT r6, hi_digit_ok
    ADDI r5, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r5          ; high nibble char
    ADD r21, r15
    STORE r21, r9          ; low nibble char
    ADD r21, r15

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r4, 8
    CMP r22, r4
    BGE r6, no_space
    LDI r4, 32             ; space
    STORE r21, r4
    ADD r21, r15
no_space:

    ADD r20, r15             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r4, 0
    STORE r21, r4

    ; Draw the row if it has any bytes
    LDI r4, 0
    CMP r22, r4
    JZ r6, dump_done

    LDI r3, 4
    LDI r14, 0x5000
    LDI r8, 0x00CC00     ; green hex
    LDI r13, 0x000011
    DRAWTEXT r3, r11, r14, r8, r13

    ADD r11, r0            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r12, 0x440044
    LDI r1, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r1, r16, r17, r18, r12

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r3, 4
    LDI r11, 246
    LDI r14, 0x5000
    LDI r8, 0xFFFFFF
    LDI r13, 0x440044
    DRAWTEXT r3, r11, r14, r8, r13

    HALT
