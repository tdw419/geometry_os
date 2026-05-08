; DESCRIPTION: This GeOS assembly code lists the contents of the Virtual File System (VFS) base directory by calling the LS syscall and displaying filenames as colored text on the screen. It also outputs the entry count at RAM address 0x7800.

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
    LDI r0, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r0, r16, r17, r18, r8

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r15, 4
    LDI r2, 2
    LDI r4, 0x5000
    LDI r13, 0xFFFFFF
    LDI r9, 0x000066
    DRAWTEXT r15, r2, r4, r13, r9

    ; --- Call LS to list files ---
    LDI r3, 0x5100
    LS r3                   ; r12 = entry count

    ; Store entry count at 0x7800
    LDI r5, 0x7800
    STORE r5, r12
    MOV r10, r12              ; r10 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r2, 16             ; y start
    LDI r4, 0x5100         ; buffer pointer
    LDI r6, 1               ; increment
    LDI r14, 14              ; line spacing
    LDI r7, 232             ; y limit

next_file:
    CMP r2, r7
    BGE r12, footer

    ; Read first char
    LOAD r11, r4
    LDI r1, 0
    CMP r11, r1
    JZ r12, footer

    ; Draw this filename
    LDI r15, 4
    LDI r13, 0xCCCCCC
    LDI r9, 0x000022
    DRAWTEXT r15, r2, r4, r13, r9

    ; Advance pointer past null terminator
skip_chars:
    LOAD r11, r4
    LDI r1, 0
    CMP r11, r1
    JZ r12, skip_done
    ADD r4, r6
    JMP skip_chars

skip_done:
    ADD r4, r6             ; skip the null
    ADD r2, r14
    JMP next_file

footer:
    ; --- Footer ---
    LDI r8, 0x004400
    LDI r0, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r0, r16, r17, r18, r8

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r10, 48             ; ASCII digit for count
    STORE r20, r10
    LDI r6, 1
    ADD r20, r6
    STRO r20, " file(s)"

    LDI r15, 4
    LDI r2, 246
    LDI r4, 0x5000
    LDI r13, 0xFFFFFF
    LDI r9, 0x004400
    DRAWTEXT r15, r2, r4, r13, r9

    HALT
