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
    LDI r9, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r14

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r11, 4
    LDI r6, 2
    LDI r2, 0x5000
    LDI r10, 0xFFFFFF
    LDI r12, 0x000066
    DRAWTEXT r11, r6, r2, r10, r12

    ; --- Call LS to list files ---
    LDI r8, 0x5100
    LS r8                   ; r3 = entry count

    ; Store entry count at 0x7800
    LDI r4, 0x7800
    STORE r4, r3
    MOV r15, r3              ; r15 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r6, 16             ; y start
    LDI r2, 0x5100         ; buffer pointer
    LDI r5, 1               ; increment
    LDI r1, 14              ; line spacing
    LDI r7, 232             ; y limit

next_file:
    CMP r6, r7
    BGE r3, footer

    ; Read first char
    LOAD r13, r2
    LDI r0, 0
    CMP r13, r0
    JZ r3, footer

    ; Draw this filename
    LDI r11, 4
    LDI r10, 0xCCCCCC
    LDI r12, 0x000022
    DRAWTEXT r11, r6, r2, r10, r12

    ; Advance pointer past null terminator
skip_chars:
    LOAD r13, r2
    LDI r0, 0
    CMP r13, r0
    JZ r3, skip_done
    ADD r2, r5
    JMP skip_chars

skip_done:
    ADD r2, r5             ; skip the null
    ADD r6, r1
    JMP next_file

footer:
    ; --- Footer ---
    LDI r14, 0x004400
    LDI r9, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r14

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r15, 48             ; ASCII digit for count
    STORE r20, r15
    LDI r5, 1
    ADD r20, r5
    STRO r20, " file(s)"

    LDI r11, 4
    LDI r6, 246
    LDI r2, 0x5000
    LDI r10, 0xFFFFFF
    LDI r12, 0x004400
    DRAWTEXT r11, r6, r2, r10, r12

    HALT
