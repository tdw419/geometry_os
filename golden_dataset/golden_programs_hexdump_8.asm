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
    LDI r3, 0x000011
    FILL r3

    ; --- Pre-load sample text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello, Geometry OS!"

    ; --- Count bytes ---
    LDI r1, 0x6000
    LDI r12, 0             ; byte count

count_loop:
    LOAD r15, r1
    LDI r14, 0
    CMP r15, r14
    JZ r5, count_done
    ADDI r12, 1
    ADDI r1, 1
    JMP count_loop

count_done:
    ; Store byte count
    LDI r0, 0x7800
    STORE r0, r12

    ; --- Draw header ---
    LDI r3, 0x440044       ; purple header
    LDI r10, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r10, r16, r17, r18, r3

    LDI r20, 0x5000
    STRO r20, "Hex Dump"
    LDI r1, 4
    LDI r12, 2
    LDI r7, 0x5000
    LDI r8, 0xFFFFFF
    LDI r4, 0x440044
    DRAWTEXT r1, r12, r7, r8, r4

    ; --- Convert each byte to hex and display ---
    ; We display 8 bytes per row as "XX XX XX XX XX XX XX XX"
    ; Each hex pair = 2 hex chars, space between = 3 chars per byte, 8 bytes = 23 chars + null = 24

    LDI r20, 0x6000        ; source pointer
    LDI r12, 16            ; y position
    LDI r11, 14             ; line spacing
    LDI r13, 1
    LDI r2, 8              ; bytes per row

row_loop:
    ; Build hex string at 0x5000
    LDI r21, 0x5000        ; output pointer
    LDI r22, 0             ; byte counter for this row

byte_loop:
    ; Read source byte
    LOAD r15, r20
    LDI r14, 0
    CMP r15, r14
    JZ r5, flush_row       ; end of data

    ; Convert low nibble to hex char
    LDI r6, 0xF
    MOV r9, r15
    AND r9, r6             ; low nibble
    ADDI r9, 48            ; '0' + nibble
    ; Adjust for A-F (10-15)
    LDI r0, 10
    CMP r9, r0
    BLT r5, lo_digit_ok
    ADDI r9, 7             ; skip past ':' to 'A'
lo_digit_ok:

    ; Convert high nibble to hex char
    LDI r6, 4
    MOV r0, r15
    SHR r0, r6             ; high nibble
    ADDI r0, 48
    LDI r14, 10
    CMP r0, r14
    BLT r5, hi_digit_ok
    ADDI r0, 7
hi_digit_ok:

    ; Store high nibble first, then low
    STORE r21, r0          ; high nibble char
    ADD r21, r13
    STORE r21, r9          ; low nibble char
    ADD r21, r13

    ; Add space (except after last byte)
    ADDI r22, 1
    LDI r14, 8
    CMP r22, r14
    BGE r5, no_space
    LDI r14, 32             ; space
    STORE r21, r14
    ADD r21, r13
no_space:

    ADD r20, r13             ; advance source
    JMP byte_loop

flush_row:
    ; Null terminate
    LDI r14, 0
    STORE r21, r14

    ; Draw the row if it has any bytes
    LDI r14, 0
    CMP r22, r14
    JZ r5, dump_done

    LDI r1, 4
    LDI r7, 0x5000
    LDI r8, 0x00CC00     ; green hex
    LDI r4, 0x000011
    DRAWTEXT r1, r12, r7, r8, r4

    ADD r12, r11            ; next row
    JMP row_loop

dump_done:
    ; --- Footer with byte count ---
    LDI r3, 0x440044
    LDI r10, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r10, r16, r17, r18, r3

    LDI r20, 0x5000
    STRO r20, "Bytes:"
    LDI r1, 4
    LDI r12, 246
    LDI r7, 0x5000
    LDI r8, 0xFFFFFF
    LDI r4, 0x440044
    DRAWTEXT r1, r12, r7, r8, r4

    HALT
