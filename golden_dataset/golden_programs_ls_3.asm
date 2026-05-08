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
    LDI r11, 0x000022
    FILL r11

    ; --- Draw title bar ---
    LDI r11, 0x000066
    LDI r0, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r0, r16, r17, r18, r11

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r4, 4
    LDI r6, 2
    LDI r8, 0x5000
    LDI r13, 0xFFFFFF
    LDI r2, 0x000066
    DRAWTEXT r4, r6, r8, r13, r2

    ; --- Call LS to list files ---
    LDI r3, 0x5100
    LS r3                   ; r9 = entry count

    ; Store entry count at 0x7800
    LDI r10, 0x7800
    STORE r10, r9
    MOV r1, r9              ; r1 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r6, 16             ; y start
    LDI r8, 0x5100         ; buffer pointer
    LDI r5, 1               ; increment
    LDI r15, 14              ; line spacing
    LDI r7, 232             ; y limit

next_file:
    CMP r6, r7
    BGE r9, footer

    ; Read first char
    LOAD r14, r8
    LDI r12, 0
    CMP r14, r12
    JZ r9, footer

    ; Draw this filename
    LDI r4, 4
    LDI r13, 0xCCCCCC
    LDI r2, 0x000022
    DRAWTEXT r4, r6, r8, r13, r2

    ; Advance pointer past null terminator
skip_chars:
    LOAD r14, r8
    LDI r12, 0
    CMP r14, r12
    JZ r9, skip_done
    ADD r8, r5
    JMP skip_chars

skip_done:
    ADD r8, r5             ; skip the null
    ADD r6, r15
    JMP next_file

footer:
    ; --- Footer ---
    LDI r11, 0x004400
    LDI r0, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r0, r16, r17, r18, r11

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r1, 48             ; ASCII digit for count
    STORE r20, r1
    LDI r5, 1
    ADD r20, r5
    STRO r20, " file(s)"

    LDI r4, 4
    LDI r6, 246
    LDI r8, 0x5000
    LDI r13, 0xFFFFFF
    LDI r2, 0x004400
    DRAWTEXT r4, r6, r8, r13, r2

    HALT
