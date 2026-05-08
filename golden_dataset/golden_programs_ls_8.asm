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
    LDI r8, 0x000022
    FILL r8

    ; --- Draw title bar ---
    LDI r8, 0x000066
    LDI r3, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r3, r16, r17, r18, r8

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r14, 4
    LDI r7, 2
    LDI r2, 0x5000
    LDI r12, 0xFFFFFF
    LDI r15, 0x000066
    DRAWTEXT r14, r7, r2, r12, r15

    ; --- Call LS to list files ---
    LDI r9, 0x5100
    LS r9                   ; r5 = entry count

    ; Store entry count at 0x7800
    LDI r1, 0x7800
    STORE r1, r5
    MOV r13, r5              ; r13 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r7, 16             ; y start
    LDI r2, 0x5100         ; buffer pointer
    LDI r10, 1               ; increment
    LDI r4, 14              ; line spacing
    LDI r6, 232             ; y limit

next_file:
    CMP r7, r6
    BGE r5, footer

    ; Read first char
    LOAD r0, r2
    LDI r11, 0
    CMP r0, r11
    JZ r5, footer

    ; Draw this filename
    LDI r14, 4
    LDI r12, 0xCCCCCC
    LDI r15, 0x000022
    DRAWTEXT r14, r7, r2, r12, r15

    ; Advance pointer past null terminator
skip_chars:
    LOAD r0, r2
    LDI r11, 0
    CMP r0, r11
    JZ r5, skip_done
    ADD r2, r10
    JMP skip_chars

skip_done:
    ADD r2, r10             ; skip the null
    ADD r7, r4
    JMP next_file

footer:
    ; --- Footer ---
    LDI r8, 0x004400
    LDI r3, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r3, r16, r17, r18, r8

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r13, 48             ; ASCII digit for count
    STORE r20, r13
    LDI r10, 1
    ADD r20, r10
    STRO r20, " file(s)"

    LDI r14, 4
    LDI r7, 246
    LDI r2, 0x5000
    LDI r12, 0xFFFFFF
    LDI r15, 0x004400
    DRAWTEXT r14, r7, r2, r12, r15

    HALT
