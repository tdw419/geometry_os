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
    LDI r2, 0x000011
    FILL r2

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r9, 0x6000
    LDI r1, 0             ; byte count

count_loop:
    LOAD r15, r9
    LDI r3, 0
    CMP r15, r3
    JZ r0, count_done
    ADDI r1, 1
    ADDI r9, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r14, 0x7800
    STORE r14, r1

    ; --- Draw header ---
    LDI r2, 0x440044       ; purple header
    LDI r13, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r13, r16, r17, r18, r2

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r9, 4
    LDI r1, 2
    LDI r7, 0x5000
    LDI r6, 0xFFFFFF
    LDI r11, 0x440044
    DRAWTEXT r9, r1, r7, r6, r11

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r1, 16            ; y position
    LDI r10, 14             ; line spacing
    LDI r8, 1
    LDI r4, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r15, r20
    LDI r3, 0
    CMP r15, r3
    JZ r0, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r5, 0xF
    MOV r12, r15
    AND r12, r5             ; low nibble
    ADDI r12, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r14, 10
    CMP r12, r14
    BLT r0, lo_digit_ok
    ADDI r12, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r5, 4
    MOV r14, r15
    SHR r14, r5             ; high nibble
    ADDI r14, 48
    LDI r3, 10
    CMP r14, r3
    BLT r0, hi_digit_ok
    ADDI r14, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r14          ; high nibble char
    ADD r21, r8
    STORE r21, r12          ; low nibble char
    ADD r21, r8

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r3, 8
    CMP r22, r3
    BGE r0, no_space
    LDI r3, 32             ; space
    STORE r21, r3
    ADD r21, r8
no_space:

    ADD r20, r8             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r3, 0
    STORE r21, r3

    ; Draw the row if it has any bytes
    LDI r3, 0
    CMP r22, r3
    JZ r0, dump_done

    LDI r9, 4
    LDI r7, 0x5000
    LDI r6, 0x00CC00     ; green hex
    LDI r11, 0x000011
    DRAWTEXT r9, r1, r7, r6, r11

    ADD r1, r10            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r2, 0x440044
    LDI r13, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r13, r16, r17, r18, r2

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r9, 4
    LDI r1, 246
    LDI r7, 0x5000
    LDI r6, 0xFFFFFF
    LDI r11, 0x440044
    DRAWTEXT r9, r1, r7, r6, r11

    HALT
