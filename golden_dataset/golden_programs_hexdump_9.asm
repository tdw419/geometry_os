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
    LDI r14, 0x000011
    FILL r14

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r12, 0x6000
    LDI r10, 0             ; byte count

count_loop:
    LOAD r9, r12
    LDI r13, 0
    CMP r9, r13
    JZ r4, count_done
    ADDI r10, 1
    ADDI r12, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r6, 0x7800
    STORE r6, r10

    ; --- Draw header ---
    LDI r14, 0x440044       ; purple header
    LDI r15, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r15, r16, r17, r18, r14

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r12, 4
    LDI r10, 2
    LDI r3, 0x5000
    LDI r7, 0xFFFFFF
    LDI r1, 0x440044
    DRAWTEXT r12, r10, r3, r7, r1

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r10, 16            ; y position
    LDI r5, 14             ; line spacing
    LDI r8, 1
    LDI r0, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r9, r20
    LDI r13, 0
    CMP r9, r13
    JZ r4, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r2, 0xF
    MOV r11, r9
    AND r11, r2             ; low nibble
    ADDI r11, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r6, 10
    CMP r11, r6
    BLT r4, lo_digit_ok
    ADDI r11, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r2, 4
    MOV r6, r9
    SHR r6, r2             ; high nibble
    ADDI r6, 48
    LDI r13, 10
    CMP r6, r13
    BLT r4, hi_digit_ok
    ADDI r6, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r6          ; high nibble char
    ADD r21, r8
    STORE r21, r11          ; low nibble char
    ADD r21, r8

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r13, 8
    CMP r22, r13
    BGE r4, no_space
    LDI r13, 32             ; space
    STORE r21, r13
    ADD r21, r8
no_space:

    ADD r20, r8             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r13, 0
    STORE r21, r13

    ; Draw the row if it has any bytes
    LDI r13, 0
    CMP r22, r13
    JZ r4, dump_done

    LDI r12, 4
    LDI r3, 0x5000
    LDI r7, 0x00CC00     ; green hex
    LDI r1, 0x000011
    DRAWTEXT r12, r10, r3, r7, r1

    ADD r10, r5            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r14, 0x440044
    LDI r15, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r15, r16, r17, r18, r14

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r12, 4
    LDI r10, 246
    LDI r3, 0x5000
    LDI r7, 0xFFFFFF
    LDI r1, 0x440044
    DRAWTEXT r12, r10, r3, r7, r1

    HALT
