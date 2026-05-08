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
    LDI r6, 0x000011
    FILL r6

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r11, 0x6000
    LDI r13, 0             ; byte count

count_loop:
    LOAD r2, r11
    LDI r15, 0
    CMP r2, r15
    JZ r10, count_done
    ADDI r13, 1
    ADDI r11, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r0, 0x7800
    STORE r0, r13

    ; --- Draw header ---
    LDI r6, 0x440044       ; purple header
    LDI r8, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r6

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r11, 4
    LDI r13, 2
    LDI r9, 0x5000
    LDI r5, 0xFFFFFF
    LDI r4, 0x440044
    DRAWTEXT r11, r13, r9, r5, r4

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r13, 16            ; y position
    LDI r1, 14             ; line spacing
    LDI r14, 1
    LDI r3, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r2, r20
    LDI r15, 0
    CMP r2, r15
    JZ r10, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r12, 0xF
    MOV r7, r2
    AND r7, r12             ; low nibble
    ADDI r7, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r0, 10
    CMP r7, r0
    BLT r10, lo_digit_ok
    ADDI r7, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r12, 4
    MOV r0, r2
    SHR r0, r12             ; high nibble
    ADDI r0, 48
    LDI r15, 10
    CMP r0, r15
    BLT r10, hi_digit_ok
    ADDI r0, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r0          ; high nibble char
    ADD r21, r14
    STORE r21, r7          ; low nibble char
    ADD r21, r14

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r15, 8
    CMP r22, r15
    BGE r10, no_space
    LDI r15, 32             ; space
    STORE r21, r15
    ADD r21, r14
no_space:

    ADD r20, r14             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r15, 0
    STORE r21, r15

    ; Draw the row if it has any bytes
    LDI r15, 0
    CMP r22, r15
    JZ r10, dump_done

    LDI r11, 4
    LDI r9, 0x5000
    LDI r5, 0x00CC00     ; green hex
    LDI r4, 0x000011
    DRAWTEXT r11, r13, r9, r5, r4

    ADD r13, r1            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r6, 0x440044
    LDI r8, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r6

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r11, 4
    LDI r13, 246
    LDI r9, 0x5000
    LDI r5, 0xFFFFFF
    LDI r4, 0x440044
    DRAWTEXT r11, r13, r9, r5, r4

    HALT
