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
    LDI r15, 0x000011
    FILL r15

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r10, 0x6000
    LDI r5, 0             ; byte count

count_loop:
    LOAD r14, r10
    LDI r9, 0
    CMP r14, r9
    JZ r8, count_done
    ADDI r5, 1
    ADDI r10, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r1, 0x7800
    STORE r1, r5

    ; --- Draw header ---
    LDI r15, 0x440044       ; purple header
    LDI r12, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r12, r16, r17, r18, r15

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r10, 4
    LDI r5, 2
    LDI r6, 0x5000
    LDI r0, 0xFFFFFF
    LDI r4, 0x440044
    DRAWTEXT r10, r5, r6, r0, r4

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r5, 16            ; y position
    LDI r11, 14             ; line spacing
    LDI r13, 1
    LDI r3, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r14, r20
    LDI r9, 0
    CMP r14, r9
    JZ r8, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r7, 0xF
    MOV r2, r14
    AND r2, r7             ; low nibble
    ADDI r2, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r1, 10
    CMP r2, r1
    BLT r8, lo_digit_ok
    ADDI r2, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r7, 4
    MOV r1, r14
    SHR r1, r7             ; high nibble
    ADDI r1, 48
    LDI r9, 10
    CMP r1, r9
    BLT r8, hi_digit_ok
    ADDI r1, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r1          ; high nibble char
    ADD r21, r13
    STORE r21, r2          ; low nibble char
    ADD r21, r13

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r9, 8
    CMP r22, r9
    BGE r8, no_space
    LDI r9, 32             ; space
    STORE r21, r9
    ADD r21, r13
no_space:

    ADD r20, r13             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r9, 0
    STORE r21, r9

    ; Draw the row if it has any bytes
    LDI r9, 0
    CMP r22, r9
    JZ r8, dump_done

    LDI r10, 4
    LDI r6, 0x5000
    LDI r0, 0x00CC00     ; green hex
    LDI r4, 0x000011
    DRAWTEXT r10, r5, r6, r0, r4

    ADD r5, r11            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r15, 0x440044
    LDI r12, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r12, r16, r17, r18, r15

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r10, 4
    LDI r5, 246
    LDI r6, 0x5000
    LDI r0, 0xFFFFFF
    LDI r4, 0x440044
    DRAWTEXT r10, r5, r6, r0, r4

    HALT
