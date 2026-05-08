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
    LDI r14, 0x000022
    FILL r14

    ; --- Draw title bar ---
    LDI r14, 0x000066
    LDI r10, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r10, r16, r17, r18, r14

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r15, 4
    LDI r1, 2
    LDI r9, 0x5000
    LDI r11, 0xFFFFFF
    LDI r7, 0x000066
    DRAWTEXT r15, r1, r9, r11, r7

    ; --- Call LS to list files ---
    LDI r5, 0x5100
    LS r5                   ; r12 = entry count

    ; Store entry count at 0x7800
    LDI r13, 0x7800
    STORE r13, r12
    MOV r2, r12              ; r2 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r1, 16             ; y start
    LDI r9, 0x5100         ; buffer pointer
    LDI r0, 1               ; increment
    LDI r6, 14              ; line spacing
    LDI r8, 232             ; y limit

next_file:
    CMP r1, r8
    BGE r12, footer

    ; Read first char
    LOAD r3, r9
    LDI r4, 0
    CMP r3, r4
    JZ r12, footer

    ; Draw this filename
    LDI r15, 4
    LDI r11, 0xCCCCCC
    LDI r7, 0x000022
    DRAWTEXT r15, r1, r9, r11, r7

    ; Advance pointer past null terminator
skip_chars:
    LOAD r3, r9
    LDI r4, 0
    CMP r3, r4
    JZ r12, skip_done
    ADD r9, r0
    JMP skip_chars

skip_done:
    ADD r9, r0             ; skip the null
    ADD r1, r6
    JMP next_file

footer:
    ; --- Footer ---
    LDI r14, 0x004400
    LDI r10, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r10, r16, r17, r18, r14

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r2, 48             ; ASCII digit for count
    STORE r20, r2
    LDI r0, 1
    ADD r20, r0
    STRO r20, " file(s)"

    LDI r15, 4
    LDI r1, 246
    LDI r9, 0x5000
    LDI r11, 0xFFFFFF
    LDI r7, 0x004400
    DRAWTEXT r15, r1, r9, r11, r7

    HALT
