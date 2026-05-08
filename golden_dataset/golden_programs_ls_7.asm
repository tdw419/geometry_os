; DESCRIPTION: Geometry OS program to draw a red rectangle.

; ls.asm -- List VFS directory contents
;
; Uses the LS syscall to enumerate files from the VFS base directory.
; Displays filenames as colored text on screen using DRAWTEXT.
; Outputs entry count at RAM[0x7800].
;
; Memory layout:
;   0x5000-0x50FF - text buffer
;   0x5100-0x5FFF - LS buffer (3840 words)
;   0x7800 - entry count

    ; --- Fill screen dark ---
    LDI r2, 0x000022
    FILL r2

    ; --- Draw title bar ---
    LDI r2, 0x000066
    LDI r7, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r7, r16, r17, r18, r2

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r0, 4
    LDI r13, 2
    LDI r10, 0x5000
    LDI r5, 0xFFFFFF
    LDI r9, 0x000066
    DRAWTEXT r0, r13, r10, r5, r9

    ; --- Call LS to list files ---
    LDI r1, 0x5100
    LS r1                   ; r12 = entry count

    ; Store entry count at 0x7800
    LDI r8, 0x7800
    STORE r8, r12
    MOV r11, r12              ; r11 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r13, 16             ; y start
    LDI r10, 0x5100         ; buffer pointer
    LDI r14, 1               ; increment
    LDI r15, 14              ; line spacing
    LDI r3, 232             ; y limit

next_file:
    CMP r13, r3
    BGE r12, footer

    ; Read first char
    LOAD r6, r10
    LDI r4, 0
    CMP r6, r4
    JZ r12, footer

    ; Draw this filename
    LDI r0, 4
    LDI r5, 0xCCCCCC
    LDI r9, 0x000022
    DRAWTEXT r0, r13, r10, r5, r9

    ; Advance pointer past null terminator
skip_chars:
    LOAD r6, r10
    LDI r4, 0
    CMP r6, r4
    JZ r12, skip_done
    ADD r10, r14
    JMP skip_chars

skip_done:
    ADD r10, r14             ; skip the null
    ADD r13, r15
    JMP next_file

footer:
    ; --- Footer ---
    LDI r2, 0x004400
    LDI r7, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r7, r16, r17, r18, r2

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r11, 48             ; ASCII digit for count
    STORE r20, r11
    LDI r14, 1
    ADD r20, r14
    STRO r20, " file(s)"

    LDI r0, 4
    LDI r13, 246
    LDI r10, 0x5000
    LDI r5, 0xFFFFFF
    LDI r9, 0x004400
    DRAWTEXT r0, r13, r10, r5, r9

    HALT
