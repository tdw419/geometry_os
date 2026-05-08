; DESCRIPTION: Render a red object at the screen.

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
    LDI r9, 0x000011
    FILL r9

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r13, 0x6000
    LDI r4, 0             ; byte count

count_loop:
    LOAD r12, r13
    LDI r6, 0
    CMP r12, r6
    JZ r1, count_done
    ADDI r4, 1
    ADDI r13, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r11, 0x7800
    STORE r11, r4

    ; --- Draw header ---
    LDI r9, 0x440044       ; purple header
    LDI r5, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r5, r16, r17, r18, r9

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r13, 4
    LDI r4, 2
    LDI r3, 0x5000
    LDI r14, 0xFFFFFF
    LDI r10, 0x440044
    DRAWTEXT r13, r4, r3, r14, r10

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r4, 16            ; y position
    LDI r0, 14             ; line spacing
    LDI r7, 1
    LDI r8, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r12, r20
    LDI r6, 0
    CMP r12, r6
    JZ r1, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r2, 0xF
    MOV r15, r12
    AND r15, r2             ; low nibble
    ADDI r15, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r11, 10
    CMP r15, r11
    BLT r1, lo_digit_ok
    ADDI r15, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r2, 4
    MOV r11, r12
    SHR r11, r2             ; high nibble
    ADDI r11, 48
    LDI r6, 10
    CMP r11, r6
    BLT r1, hi_digit_ok
    ADDI r11, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r11          ; high nibble char
    ADD r21, r7
    STORE r21, r15          ; low nibble char
    ADD r21, r7

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r6, 8
    CMP r22, r6
    BGE r1, no_space
    LDI r6, 32             ; space
    STORE r21, r6
    ADD r21, r7
no_space:

    ADD r20, r7             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r6, 0
    STORE r21, r6

    ; Draw the row if it has any bytes
    LDI r6, 0
    CMP r22, r6
    JZ r1, dump_done

    LDI r13, 4
    LDI r3, 0x5000
    LDI r14, 0x00CC00     ; green hex
    LDI r10, 0x000011
    DRAWTEXT r13, r4, r3, r14, r10

    ADD r4, r0            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r9, 0x440044
    LDI r5, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r5, r16, r17, r18, r9

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r13, 4
    LDI r4, 246
    LDI r3, 0x5000
    LDI r14, 0xFFFFFF
    LDI r10, 0x440044
    DRAWTEXT r13, r4, r3, r14, r10

    HALT
