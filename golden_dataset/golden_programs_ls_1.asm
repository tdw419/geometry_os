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
    LDI r14, 0x000022
    FILL r14

    ; --- Draw title bar ---
    LDI r14, 0x000066
    LDI r6, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r6, r16, r17, r18, r14

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r10, 4
    LDI r0, 2
    LDI r9, 0x5000
    LDI r5, 0xFFFFFF
    LDI r1, 0x000066
    DRAWTEXT r10, r0, r9, r5, r1

    ; --- Call LS to list files ---
    LDI r13, 0x5100
    LS r13                   ; r7 = entry count

    ; Store entry count at 0x7800
    LDI r2, 0x7800
    STORE r2, r7
    MOV r8, r7              ; r8 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r0, 16             ; y start
    LDI r9, 0x5100         ; buffer pointer
    LDI r12, 1               ; increment
    LDI r11, 14              ; line spacing
    LDI r3, 232             ; y limit

next_file:
    CMP r0, r3
    BGE r7, footer

    ; Read first char
    LOAD r15, r9
    LDI r4, 0
    CMP r15, r4
    JZ r7, footer

    ; Draw this filename
    LDI r10, 4
    LDI r5, 0xCCCCCC
    LDI r1, 0x000022
    DRAWTEXT r10, r0, r9, r5, r1

    ; Advance pointer past null terminator
skip_chars:
    LOAD r15, r9
    LDI r4, 0
    CMP r15, r4
    JZ r7, skip_done
    ADD r9, r12
    JMP skip_chars

skip_done:
    ADD r9, r12             ; skip the null
    ADD r0, r11
    JMP next_file

footer:
    ; --- Footer ---
    LDI r14, 0x004400
    LDI r6, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r6, r16, r17, r18, r14

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r8, 48             ; ASCII digit for count
    STORE r20, r8
    LDI r12, 1
    ADD r20, r12
    STRO r20, " file(s)"

    LDI r10, 4
    LDI r0, 246
    LDI r9, 0x5000
    LDI r5, 0xFFFFFF
    LDI r1, 0x004400
    DRAWTEXT r10, r0, r9, r5, r1

    HALT
