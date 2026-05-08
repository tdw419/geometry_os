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
    LDI r7, 0x000022
    FILL r7

    ; --- Draw title bar ---
    LDI r7, 0x000066
    LDI r9, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r7

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r8, 4
    LDI r12, 2
    LDI r11, 0x5000
    LDI r10, 0xFFFFFF
    LDI r14, 0x000066
    DRAWTEXT r8, r12, r11, r10, r14

    ; --- Call LS to list files ---
    LDI r3, 0x5100
    LS r3                   ; r2 = entry count

    ; Store entry count at 0x7800
    LDI r6, 0x7800
    STORE r6, r2
    MOV r5, r2              ; r5 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r12, 16             ; y start
    LDI r11, 0x5100         ; buffer pointer
    LDI r13, 1               ; increment
    LDI r1, 14              ; line spacing
    LDI r15, 232             ; y limit

next_file:
    CMP r12, r15
    BGE r2, footer

    ; Read first char
    LOAD r0, r11
    LDI r4, 0
    CMP r0, r4
    JZ r2, footer

    ; Draw this filename
    LDI r8, 4
    LDI r10, 0xCCCCCC
    LDI r14, 0x000022
    DRAWTEXT r8, r12, r11, r10, r14

    ; Advance pointer past null terminator
skip_chars:
    LOAD r0, r11
    LDI r4, 0
    CMP r0, r4
    JZ r2, skip_done
    ADD r11, r13
    JMP skip_chars

skip_done:
    ADD r11, r13             ; skip the null
    ADD r12, r1
    JMP next_file

footer:
    ; --- Footer ---
    LDI r7, 0x004400
    LDI r9, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r7

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r5, 48             ; ASCII digit for count
    STORE r20, r5
    LDI r13, 1
    ADD r20, r13
    STRO r20, " file(s)"

    LDI r8, 4
    LDI r12, 246
    LDI r11, 0x5000
    LDI r10, 0xFFFFFF
    LDI r14, 0x004400
    DRAWTEXT r8, r12, r11, r10, r14

    HALT
