; DESCRIPTION: Display a object using color red at the screen.

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
    LDI r6, 0x6000
    LDI r14, 0             ; byte count

count_loop:
    LOAD r4, r6
    LDI r11, 0
    CMP r4, r11
    JZ r13, count_done
    ADDI r14, 1
    ADDI r6, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r9, 0x7800
    STORE r9, r14

    ; --- Draw header ---
    LDI r12, 0x440044       ; purple header
    LDI r8, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r12

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r6, 4
    LDI r14, 2
    LDI r5, 0x5000
    LDI r2, 0xFFFFFF
    LDI r0, 0x440044
    DRAWTEXT r6, r14, r5, r2, r0

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r14, 16            ; y position
    LDI r7, 14             ; line spacing
    LDI r10, 1
    LDI r1, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r4, r20
    LDI r11, 0
    CMP r4, r11
    JZ r13, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r3, 0xF
    MOV r15, r4
    AND r15, r3             ; low nibble
    ADDI r15, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r9, 10
    CMP r15, r9
    BLT r13, lo_digit_ok
    ADDI r15, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r3, 4
    MOV r9, r4
    SHR r9, r3             ; high nibble
    ADDI r9, 48
    LDI r11, 10
    CMP r9, r11
    BLT r13, hi_digit_ok
    ADDI r9, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r9          ; high nibble char
    ADD r21, r10
    STORE r21, r15          ; low nibble char
    ADD r21, r10

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r11, 8
    CMP r22, r11
    BGE r13, no_space
    LDI r11, 32             ; space
    STORE r21, r11
    ADD r21, r10
no_space:

    ADD r20, r10             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r11, 0
    STORE r21, r11

    ; Draw the row if it has any bytes
    LDI r11, 0
    CMP r22, r11
    JZ r13, dump_done

    LDI r6, 4
    LDI r5, 0x5000
    LDI r2, 0x00CC00     ; green hex
    LDI r0, 0x000011
    DRAWTEXT r6, r14, r5, r2, r0

    ADD r14, r7            ; next row
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
    LDI r6, 4
    LDI r14, 246
    LDI r5, 0x5000
    LDI r2, 0xFFFFFF
    LDI r0, 0x440044
    DRAWTEXT r6, r14, r5, r2, r0

    HALT
