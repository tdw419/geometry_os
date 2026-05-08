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
    LDI r4, 0x000022
    FILL r4

    ; --- Draw title bar ---
    LDI r4, 0x000066
    LDI r13, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r13, r16, r17, r18, r4

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r7, 4
    LDI r2, 2
    LDI r3, 0x5000
    LDI r15, 0xFFFFFF
    LDI r0, 0x000066
    DRAWTEXT r7, r2, r3, r15, r0

    ; --- Call LS to list files ---
    LDI r10, 0x5100
    LS r10                   ; r9 = entry count

    ; Store entry count at 0x7800
    LDI r8, 0x7800
    STORE r8, r9
    MOV r14, r9              ; r14 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r2, 16             ; y start
    LDI r3, 0x5100         ; buffer pointer
    LDI r12, 1               ; increment
    LDI r5, 14              ; line spacing
    LDI r11, 232             ; y limit

next_file:
    CMP r2, r11
    BGE r9, footer

    ; Read first char
    LOAD r1, r3
    LDI r6, 0
    CMP r1, r6
    JZ r9, footer

    ; Draw this filename
    LDI r7, 4
    LDI r15, 0xCCCCCC
    LDI r0, 0x000022
    DRAWTEXT r7, r2, r3, r15, r0

    ; Advance pointer past null terminator
skip_chars:
    LOAD r1, r3
    LDI r6, 0
    CMP r1, r6
    JZ r9, skip_done
    ADD r3, r12
    JMP skip_chars

skip_done:
    ADD r3, r12             ; skip the null
    ADD r2, r5
    JMP next_file

footer:
    ; --- Footer ---
    LDI r4, 0x004400
    LDI r13, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r13, r16, r17, r18, r4

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r14, 48             ; ASCII digit for count
    STORE r20, r14
    LDI r12, 1
    ADD r20, r12
    STRO r20, " file(s)"

    LDI r7, 4
    LDI r2, 246
    LDI r3, 0x5000
    LDI r15, 0xFFFFFF
    LDI r0, 0x004400
    DRAWTEXT r7, r2, r3, r15, r0

    HALT
