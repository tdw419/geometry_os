; DESCRIPTION: A red rectangle centered at the screen with fixed size.

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
    LDI r1, 0x000022
    FILL r1

    ; --- Draw title bar ---
    LDI r1, 0x000066
    LDI r6, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r6, r16, r17, r18, r1

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r15, 4
    LDI r9, 2
    LDI r2, 0x5000
    LDI r5, 0xFFFFFF
    LDI r14, 0x000066
    DRAWTEXT r15, r9, r2, r5, r14

    ; --- Call LS to list files ---
    LDI r3, 0x5100
    LS r3                   ; r4 = entry count

    ; Store entry count at 0x7800
    LDI r10, 0x7800
    STORE r10, r4
    MOV r13, r4              ; r13 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r9, 16             ; y start
    LDI r2, 0x5100         ; buffer pointer
    LDI r12, 1               ; increment
    LDI r7, 14              ; line spacing
    LDI r11, 232             ; y limit

next_file:
    CMP r9, r11
    BGE r4, footer

    ; Read first char
    LOAD r8, r2
    LDI r0, 0
    CMP r8, r0
    JZ r4, footer

    ; Draw this filename
    LDI r15, 4
    LDI r5, 0xCCCCCC
    LDI r14, 0x000022
    DRAWTEXT r15, r9, r2, r5, r14

    ; Advance pointer past null terminator
skip_chars:
    LOAD r8, r2
    LDI r0, 0
    CMP r8, r0
    JZ r4, skip_done
    ADD r2, r12
    JMP skip_chars

skip_done:
    ADD r2, r12             ; skip the null
    ADD r9, r7
    JMP next_file

footer:
    ; --- Footer ---
    LDI r1, 0x004400
    LDI r6, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r6, r16, r17, r18, r1

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r13, 48             ; ASCII digit for count
    STORE r20, r13
    LDI r12, 1
    ADD r20, r12
    STRO r20, " file(s)"

    LDI r15, 4
    LDI r9, 246
    LDI r2, 0x5000
    LDI r5, 0xFFFFFF
    LDI r14, 0x004400
    DRAWTEXT r15, r9, r2, r5, r14

    HALT
