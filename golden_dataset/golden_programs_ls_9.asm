; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

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
    LDI r7, 0x000022
    FILL r7

    ; --- Draw title bar ---
    LDI r7, 0x000066
    LDI r1, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r1, r16, r17, r18, r7

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r5, 4
    LDI r0, 2
    LDI r12, 0x5000
    LDI r8, 0xFFFFFF
    LDI r3, 0x000066
    DRAWTEXT r5, r0, r12, r8, r3

    ; --- Call LS to list files ---
    LDI r9, 0x5100
    LS r9                   ; r14 = entry count

    ; Store entry count at 0x7800
    LDI r2, 0x7800
    STORE r2, r14
    MOV r15, r14              ; r15 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r0, 16             ; y start
    LDI r12, 0x5100         ; buffer pointer
    LDI r13, 1               ; increment
    LDI r11, 14              ; line spacing
    LDI r10, 232             ; y limit

next_file:
    CMP r0, r10
    BGE r14, footer

    ; Read first char
    LOAD r4, r12
    LDI r6, 0
    CMP r4, r6
    JZ r14, footer

    ; Draw this filename
    LDI r5, 4
    LDI r8, 0xCCCCCC
    LDI r3, 0x000022
    DRAWTEXT r5, r0, r12, r8, r3

    ; Advance pointer past null terminator
skip_chars:
    LOAD r4, r12
    LDI r6, 0
    CMP r4, r6
    JZ r14, skip_done
    ADD r12, r13
    JMP skip_chars

skip_done:
    ADD r12, r13             ; skip the null
    ADD r0, r11
    JMP next_file

footer:
    ; --- Footer ---
    LDI r7, 0x004400
    LDI r1, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r1, r16, r17, r18, r7

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r15, 48             ; ASCII digit for count
    STORE r20, r15
    LDI r13, 1
    ADD r20, r13
    STRO r20, " file(s)"

    LDI r5, 4
    LDI r0, 246
    LDI r12, 0x5000
    LDI r8, 0xFFFFFF
    LDI r3, 0x004400
    DRAWTEXT r5, r0, r12, r8, r3

    HALT
