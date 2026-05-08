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
    LDI r7, 0             ; byte count

count_loop:
    LOAD r0, r3
    LDI r1, 0
    CMP r0, r1
    JZ r11, count_done
    ADDI r7, 1
    ADDI r3, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r10, 0x7800
    STORE r10, r7

    ; --- Draw header ---
    LDI r12, 0x440044       ; purple header
    LDI r8, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r12

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r3, 4
    LDI r7, 2
    LDI r15, 0x5000
    LDI r4, 0xFFFFFF
    LDI r6, 0x440044
    DRAWTEXT r3, r7, r15, r4, r6

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r7, 16            ; y position
    LDI r13, 14             ; line spacing
    LDI r5, 1
    LDI r14, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r0, r20
    LDI r1, 0
    CMP r0, r1
    JZ r11, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r9, 0xF
    MOV r2, r0
    AND r2, r9             ; low nibble
    ADDI r2, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r10, 10
    CMP r2, r10
    BLT r11, lo_digit_ok
    ADDI r2, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r9, 4
    MOV r10, r0
    SHR r10, r9             ; high nibble
    ADDI r10, 48
    LDI r1, 10
    CMP r10, r1
    BLT r11, hi_digit_ok
    ADDI r10, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r10          ; high nibble char
    ADD r21, r5
    STORE r21, r2          ; low nibble char
    ADD r21, r5

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r1, 8
    CMP r22, r1
    BGE r11, no_space
    LDI r1, 32             ; space
    STORE r21, r1
    ADD r21, r5
no_space:

    ADD r20, r5             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r1, 0
    STORE r21, r1

    ; Draw the row if it has any bytes
    LDI r1, 0
    CMP r22, r1
    JZ r11, dump_done

    LDI r3, 4
    LDI r15, 0x5000
    LDI r4, 0x00CC00     ; green hex
    LDI r6, 0x000011
    DRAWTEXT r3, r7, r15, r4, r6

    ADD r7, r13            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r12, 0x440044
    LDI r8, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r12

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r3, 4
    LDI r7, 246
    LDI r15, 0x5000
    LDI r4, 0xFFFFFF
    LDI r6, 0x440044
    DRAWTEXT r3, r7, r15, r4, r6

    HALT
