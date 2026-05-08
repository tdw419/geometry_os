; DESCRIPTION: Draws a red object at the screen with fixed size.

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
    LDI r8, 0x000011
    FILL r8

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r15, 0x6000
    LDI r6, 0             ; byte count

count_loop:
    LOAD r1, r15
    LDI r13, 0
    CMP r1, r13
    JZ r14, count_done
    ADDI r6, 1
    ADDI r15, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r11, 0x7800
    STORE r11, r6

    ; --- Draw header ---
    LDI r8, 0x440044       ; purple header
    LDI r4, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r4, r16, r17, r18, r8

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r15, 4
    LDI r6, 2
    LDI r12, 0x5000
    LDI r2, 0xFFFFFF
    LDI r7, 0x440044
    DRAWTEXT r15, r6, r12, r2, r7

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r6, 16            ; y position
    LDI r9, 14             ; line spacing
    LDI r3, 1
    LDI r5, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r1, r20
    LDI r13, 0
    CMP r1, r13
    JZ r14, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r0, 0xF
    MOV r10, r1
    AND r10, r0             ; low nibble
    ADDI r10, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r11, 10
    CMP r10, r11
    BLT r14, lo_digit_ok
    ADDI r10, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r0, 4
    MOV r11, r1
    SHR r11, r0             ; high nibble
    ADDI r11, 48
    LDI r13, 10
    CMP r11, r13
    BLT r14, hi_digit_ok
    ADDI r11, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r11          ; high nibble char
    ADD r21, r3
    STORE r21, r10          ; low nibble char
    ADD r21, r3

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r13, 8
    CMP r22, r13
    BGE r14, no_space
    LDI r13, 32             ; space
    STORE r21, r13
    ADD r21, r3
no_space:

    ADD r20, r3             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r13, 0
    STORE r21, r13

    ; Draw the row if it has any bytes
    LDI r13, 0
    CMP r22, r13
    JZ r14, dump_done

    LDI r15, 4
    LDI r12, 0x5000
    LDI r2, 0x00CC00     ; green hex
    LDI r7, 0x000011
    DRAWTEXT r15, r6, r12, r2, r7

    ADD r6, r9            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r8, 0x440044
    LDI r4, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r4, r16, r17, r18, r8

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r15, 4
    LDI r6, 246
    LDI r12, 0x5000
    LDI r2, 0xFFFFFF
    LDI r7, 0x440044
    DRAWTEXT r15, r6, r12, r2, r7

    HALT
