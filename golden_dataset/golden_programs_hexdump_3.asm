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
    LDI r11, 0x000011
    FILL r11

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r1, 0x6000
    LDI r6, 0             ; byte count

count_loop:
    LOAD r3, r1
    LDI r10, 0
    CMP r3, r10
    JZ r7, count_done
    ADDI r6, 1
    ADDI r1, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r14, 0x7800
    STORE r14, r6

    ; --- Draw header ---
    LDI r11, 0x440044       ; purple header
    LDI r15, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r15, r16, r17, r18, r11

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r1, 4
    LDI r6, 2
    LDI r13, 0x5000
    LDI r9, 0xFFFFFF
    LDI r4, 0x440044
    DRAWTEXT r1, r6, r13, r9, r4

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r6, 16            ; y position
    LDI r2, 14             ; line spacing
    LDI r12, 1
    LDI r5, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r3, r20
    LDI r10, 0
    CMP r3, r10
    JZ r7, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r0, 0xF
    MOV r8, r3
    AND r8, r0             ; low nibble
    ADDI r8, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r14, 10
    CMP r8, r14
    BLT r7, lo_digit_ok
    ADDI r8, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r0, 4
    MOV r14, r3
    SHR r14, r0             ; high nibble
    ADDI r14, 48
    LDI r10, 10
    CMP r14, r10
    BLT r7, hi_digit_ok
    ADDI r14, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r14          ; high nibble char
    ADD r21, r12
    STORE r21, r8          ; low nibble char
    ADD r21, r12

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r10, 8
    CMP r22, r10
    BGE r7, no_space
    LDI r10, 32             ; space
    STORE r21, r10
    ADD r21, r12
no_space:

    ADD r20, r12             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r10, 0
    STORE r21, r10

    ; Draw the row if it has any bytes
    LDI r10, 0
    CMP r22, r10
    JZ r7, dump_done

    LDI r1, 4
    LDI r13, 0x5000
    LDI r9, 0x00CC00     ; green hex
    LDI r4, 0x000011
    DRAWTEXT r1, r6, r13, r9, r4

    ADD r6, r2            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r11, 0x440044
    LDI r15, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r15, r16, r17, r18, r11

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r1, 4
    LDI r6, 246
    LDI r13, 0x5000
    LDI r9, 0xFFFFFF
    LDI r4, 0x440044
    DRAWTEXT r1, r6, r13, r9, r4

    HALT
