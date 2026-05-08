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
    LDI r5, 0x000022
    FILL r5

    ; --- Draw title bar ---
    LDI r5, 0x000066
    LDI r9, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r5

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r4, 4
    LDI r10, 2
    LDI r13, 0x5000
    LDI r14, 0xFFFFFF
    LDI r15, 0x000066
    DRAWTEXT r4, r10, r13, r14, r15

    ; --- Call LS to list files ---
    LDI r7, 0x5100
    LS r7                   ; r8 = entry count

    ; Store entry count at 0x7800
    LDI r0, 0x7800
    STORE r0, r8
    MOV r11, r8              ; r11 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r10, 16             ; y start
    LDI r13, 0x5100         ; buffer pointer
    LDI r2, 1               ; increment
    LDI r6, 14              ; line spacing
    LDI r3, 232             ; y limit

next_file:
    CMP r10, r3
    BGE r8, footer

    ; Read first char
    LOAD r12, r13
    LDI r1, 0
    CMP r12, r1
    JZ r8, footer

    ; Draw this filename
    LDI r4, 4
    LDI r14, 0xCCCCCC
    LDI r15, 0x000022
    DRAWTEXT r4, r10, r13, r14, r15

    ; Advance pointer past null terminator
skip_chars:
    LOAD r12, r13
    LDI r1, 0
    CMP r12, r1
    JZ r8, skip_done
    ADD r13, r2
    JMP skip_chars

skip_done:
    ADD r13, r2             ; skip the null
    ADD r10, r6
    JMP next_file

footer:
    ; --- Footer ---
    LDI r5, 0x004400
    LDI r9, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r5

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r11, 48             ; ASCII digit for count
    STORE r20, r11
    LDI r2, 1
    ADD r20, r2
    STRO r20, " file(s)"

    LDI r4, 4
    LDI r10, 246
    LDI r13, 0x5000
    LDI r14, 0xFFFFFF
    LDI r15, 0x004400
    DRAWTEXT r4, r10, r13, r14, r15

    HALT
