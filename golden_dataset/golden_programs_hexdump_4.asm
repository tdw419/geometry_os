; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
    LDI r5, 0x000011
    FILL r5

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r9, 0x6000
    LDI r15, 0             ; byte count

count_loop:
    LOAD r12, r9
    LDI r4, 0
    CMP r12, r4
    JZ r7, count_done
    ADDI r15, 1
    ADDI r9, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r2, 0x7800
    STORE r2, r15

    ; --- Draw header ---
    LDI r5, 0x440044       ; purple header
    LDI r6, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r6, r16, r17, r18, r5

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r9, 4
    LDI r15, 2
    LDI r1, 0x5000
    LDI r3, 0xFFFFFF
    LDI r11, 0x440044
    DRAWTEXT r9, r15, r1, r3, r11

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r15, 16            ; y position
    LDI r13, 14             ; line spacing
    LDI r8, 1
    LDI r0, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r12, r20
    LDI r4, 0
    CMP r12, r4
    JZ r7, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r10, 0xF
    MOV r14, r12
    AND r14, r10             ; low nibble
    ADDI r14, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r2, 10
    CMP r14, r2
    BLT r7, lo_digit_ok
    ADDI r14, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r10, 4
    MOV r2, r12
    SHR r2, r10             ; high nibble
    ADDI r2, 48
    LDI r4, 10
    CMP r2, r4
    BLT r7, hi_digit_ok
    ADDI r2, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r2          ; high nibble char
    ADD r21, r8
    STORE r21, r14          ; low nibble char
    ADD r21, r8

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r4, 8
    CMP r22, r4
    BGE r7, no_space
    LDI r4, 32             ; space
    STORE r21, r4
    ADD r21, r8
no_space:

    ADD r20, r8             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r4, 0
    STORE r21, r4

    ; Draw the row if it has any bytes
    LDI r4, 0
    CMP r22, r4
    JZ r7, dump_done

    LDI r9, 4
    LDI r1, 0x5000
    LDI r3, 0x00CC00     ; green hex
    LDI r11, 0x000011
    DRAWTEXT r9, r15, r1, r3, r11

    ADD r15, r13            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r5, 0x440044
    LDI r6, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r6, r16, r17, r18, r5

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r9, 4
    LDI r15, 246
    LDI r1, 0x5000
    LDI r3, 0xFFFFFF
    LDI r11, 0x440044
    DRAWTEXT r9, r15, r1, r3, r11

    HALT
