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
    LDI r9, 0x000022
    FILL r9

    ; --- Draw title bar ---
    LDI r9, 0x000066
    LDI r12, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r12, r16, r17, r18, r9

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r14, 4
    LDI r10, 2
    LDI r11, 0x5000
    LDI r1, 0xFFFFFF
    LDI r15, 0x000066
    DRAWTEXT r14, r10, r11, r1, r15

    ; --- Call LS to list files ---
    LDI r7, 0x5100
    LS r7                   ; r8 = entry count

    ; Store entry count at 0x7800
    LDI r4, 0x7800
    STORE r4, r8
    MOV r2, r8              ; r2 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r10, 16             ; y start
    LDI r11, 0x5100         ; buffer pointer
    LDI r0, 1               ; increment
    LDI r13, 14              ; line spacing
    LDI r5, 232             ; y limit

next_file:
    CMP r10, r5
    BGE r8, footer

    ; Read first char
    LOAD r6, r11
    LDI r3, 0
    CMP r6, r3
    JZ r8, footer

    ; Draw this filename
    LDI r14, 4
    LDI r1, 0xCCCCCC
    LDI r15, 0x000022
    DRAWTEXT r14, r10, r11, r1, r15

    ; Advance pointer past null terminator
skip_chars:
    LOAD r6, r11
    LDI r3, 0
    CMP r6, r3
    JZ r8, skip_done
    ADD r11, r0
    JMP skip_chars

skip_done:
    ADD r11, r0             ; skip the null
    ADD r10, r13
    JMP next_file

footer:
    ; --- Footer ---
    LDI r9, 0x004400
    LDI r12, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r12, r16, r17, r18, r9

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r2, 48             ; ASCII digit for count
    STORE r20, r2
    LDI r0, 1
    ADD r20, r0
    STRO r20, " file(s)"

    LDI r14, 4
    LDI r10, 246
    LDI r11, 0x5000
    LDI r1, 0xFFFFFF
    LDI r15, 0x004400
    DRAWTEXT r14, r10, r11, r1, r15

    HALT
