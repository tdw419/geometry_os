; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

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
    LDI r5, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r5, r16, r17, r18, r14

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r1, 4
    LDI r6, 2
    LDI r3, 0x5000
    LDI r0, 0xFFFFFF
    LDI r4, 0x000066
    DRAWTEXT r1, r6, r3, r0, r4

    ; --- Call LS to list files ---
    LDI r8, 0x5100
    LS r8                   ; r10 = entry count

    ; Store entry count at 0x7800
    LDI r9, 0x7800
    STORE r9, r10
    MOV r12, r10              ; r12 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r6, 16             ; y start
    LDI r3, 0x5100         ; buffer pointer
    LDI r13, 1               ; increment
    LDI r2, 14              ; line spacing
    LDI r11, 232             ; y limit

next_file:
    CMP r6, r11
    BGE r10, footer

    ; Read first char
    LOAD r7, r3
    LDI r15, 0
    CMP r7, r15
    JZ r10, footer

    ; Draw this filename
    LDI r1, 4
    LDI r0, 0xCCCCCC
    LDI r4, 0x000022
    DRAWTEXT r1, r6, r3, r0, r4

    ; Advance pointer past null terminator
skip_chars:
    LOAD r7, r3
    LDI r15, 0
    CMP r7, r15
    JZ r10, skip_done
    ADD r3, r13
    JMP skip_chars

skip_done:
    ADD r3, r13             ; skip the null
    ADD r6, r2
    JMP next_file

footer:
    ; --- Footer ---
    LDI r14, 0x004400
    LDI r5, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r5, r16, r17, r18, r14

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r12, 48             ; ASCII digit for count
    STORE r20, r12
    LDI r13, 1
    ADD r20, r13
    STRO r20, " file(s)"

    LDI r1, 4
    LDI r6, 246
    LDI r3, 0x5000
    LDI r0, 0xFFFFFF
    LDI r4, 0x004400
    DRAWTEXT r1, r6, r3, r0, r4

    HALT
