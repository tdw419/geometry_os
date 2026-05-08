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
    LDI r0, 0x000011
    FILL r0

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r9, 0x6000
    LDI r5, 0             ; byte count

count_loop:
    LOAD r1, r9
    LDI r6, 0
    CMP r1, r6
    JZ r4, count_done
    ADDI r5, 1
    ADDI r9, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r7, 0x7800
    STORE r7, r5

    ; --- Draw header ---
    LDI r0, 0x440044       ; purple header
    LDI r14, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r14, r16, r17, r18, r0

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r9, 4
    LDI r5, 2
    LDI r13, 0x5000
    LDI r10, 0xFFFFFF
    LDI r11, 0x440044
    DRAWTEXT r9, r5, r13, r10, r11

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r5, 16            ; y position
    LDI r12, 14             ; line spacing
    LDI r8, 1
    LDI r3, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r1, r20
    LDI r6, 0
    CMP r1, r6
    JZ r4, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r15, 0xF
    MOV r2, r1
    AND r2, r15             ; low nibble
    ADDI r2, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r7, 10
    CMP r2, r7
    BLT r4, lo_digit_ok
    ADDI r2, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r15, 4
    MOV r7, r1
    SHR r7, r15             ; high nibble
    ADDI r7, 48
    LDI r6, 10
    CMP r7, r6
    BLT r4, hi_digit_ok
    ADDI r7, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r7          ; high nibble char
    ADD r21, r8
    STORE r21, r2          ; low nibble char
    ADD r21, r8

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r6, 8
    CMP r22, r6
    BGE r4, no_space
    LDI r6, 32             ; space
    STORE r21, r6
    ADD r21, r8
no_space:

    ADD r20, r8             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r6, 0
    STORE r21, r6

    ; Draw the row if it has any bytes
    LDI r6, 0
    CMP r22, r6
    JZ r4, dump_done

    LDI r9, 4
    LDI r13, 0x5000
    LDI r10, 0x00CC00     ; green hex
    LDI r11, 0x000011
    DRAWTEXT r9, r5, r13, r10, r11

    ADD r5, r12            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r0, 0x440044
    LDI r14, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r14, r16, r17, r18, r0

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r9, 4
    LDI r5, 246
    LDI r13, 0x5000
    LDI r10, 0xFFFFFF
    LDI r11, 0x440044
    DRAWTEXT r9, r5, r13, r10, r11

    HALT
