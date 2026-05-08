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
    LDI r10, 0x000011
    FILL r10

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r5, 0x6000
    LDI r2, 0             ; byte count

count_loop:
    LOAD r4, r5
    LDI r12, 0
    CMP r4, r12
    JZ r6, count_done
    ADDI r2, 1
    ADDI r5, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r11, 0x7800
    STORE r11, r2

    ; --- Draw header ---
    LDI r10, 0x440044       ; purple header
    LDI r1, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r1, r16, r17, r18, r10

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r5, 4
    LDI r2, 2
    LDI r3, 0x5000
    LDI r7, 0xFFFFFF
    LDI r15, 0x440044
    DRAWTEXT r5, r2, r3, r7, r15

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r2, 16            ; y position
    LDI r8, 14             ; line spacing
    LDI r13, 1
    LDI r14, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r4, r20
    LDI r12, 0
    CMP r4, r12
    JZ r6, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r9, 0xF
    MOV r0, r4
    AND r0, r9             ; low nibble
    ADDI r0, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r11, 10
    CMP r0, r11
    BLT r6, lo_digit_ok
    ADDI r0, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r9, 4
    MOV r11, r4
    SHR r11, r9             ; high nibble
    ADDI r11, 48
    LDI r12, 10
    CMP r11, r12
    BLT r6, hi_digit_ok
    ADDI r11, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r11          ; high nibble char
    ADD r21, r13
    STORE r21, r0          ; low nibble char
    ADD r21, r13

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r12, 8
    CMP r22, r12
    BGE r6, no_space
    LDI r12, 32             ; space
    STORE r21, r12
    ADD r21, r13
no_space:

    ADD r20, r13             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r12, 0
    STORE r21, r12

    ; Draw the row if it has any bytes
    LDI r12, 0
    CMP r22, r12
    JZ r6, dump_done

    LDI r5, 4
    LDI r3, 0x5000
    LDI r7, 0x00CC00     ; green hex
    LDI r15, 0x000011
    DRAWTEXT r5, r2, r3, r7, r15

    ADD r2, r8            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r10, 0x440044
    LDI r1, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r1, r16, r17, r18, r10

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r5, 4
    LDI r2, 246
    LDI r3, 0x5000
    LDI r7, 0xFFFFFF
    LDI r15, 0x440044
    DRAWTEXT r5, r2, r3, r7, r15

    HALT
