; DESCRIPTION: A red object centered at the screen with fixed size.

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
    LDI r4, 0x000011
    FILL r4

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r11, 0x6000
    LDI r3, 0             ; byte count

count_loop:
    LOAD r7, r11
    LDI r2, 0
    CMP r7, r2
    JZ r6, count_done
    ADDI r3, 1
    ADDI r11, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r15, 0x7800
    STORE r15, r3

    ; --- Draw header ---
    LDI r4, 0x440044       ; purple header
    LDI r8, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r4

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r11, 4
    LDI r3, 2
    LDI r1, 0x5000
    LDI r12, 0xFFFFFF
    LDI r5, 0x440044
    DRAWTEXT r11, r3, r1, r12, r5

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r3, 16            ; y position
    LDI r0, 14             ; line spacing
    LDI r13, 1
    LDI r14, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r7, r20
    LDI r2, 0
    CMP r7, r2
    JZ r6, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r9, 0xF
    MOV r10, r7
    AND r10, r9             ; low nibble
    ADDI r10, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r15, 10
    CMP r10, r15
    BLT r6, lo_digit_ok
    ADDI r10, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r9, 4
    MOV r15, r7
    SHR r15, r9             ; high nibble
    ADDI r15, 48
    LDI r2, 10
    CMP r15, r2
    BLT r6, hi_digit_ok
    ADDI r15, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r15          ; high nibble char
    ADD r21, r13
    STORE r21, r10          ; low nibble char
    ADD r21, r13

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r2, 8
    CMP r22, r2
    BGE r6, no_space
    LDI r2, 32             ; space
    STORE r21, r2
    ADD r21, r13
no_space:

    ADD r20, r13             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r2, 0
    STORE r21, r2

    ; Draw the row if it has any bytes
    LDI r2, 0
    CMP r22, r2
    JZ r6, dump_done

    LDI r11, 4
    LDI r1, 0x5000
    LDI r12, 0x00CC00     ; green hex
    LDI r5, 0x000011
    DRAWTEXT r11, r3, r1, r12, r5

    ADD r3, r0            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r4, 0x440044
    LDI r8, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r4

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r11, 4
    LDI r3, 246
    LDI r1, 0x5000
    LDI r12, 0xFFFFFF
    LDI r5, 0x440044
    DRAWTEXT r11, r3, r1, r12, r5

    HALT
