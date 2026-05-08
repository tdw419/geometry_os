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
    LDI r9, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r11

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r1, 4
    LDI r2, 2
    LDI r0, 0x5000
    LDI r8, 0xFFFFFF
    LDI r4, 0x000066
    DRAWTEXT r1, r2, r0, r8, r4

    ; --- Call LS to list files ---
    LDI r13, 0x5100
    LS r13                   ; r3 = entry count

    ; Store entry count at 0x7800
    LDI r6, 0x7800
    STORE r6, r3
    MOV r5, r3              ; r5 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r2, 16             ; y start
    LDI r0, 0x5100         ; buffer pointer
    LDI r14, 1               ; increment
    LDI r15, 14              ; line spacing
    LDI r10, 232             ; y limit

next_file:
    CMP r2, r10
    BGE r3, footer

    ; Read first char
    LOAD r7, r0
    LDI r12, 0
    CMP r7, r12
    JZ r3, footer

    ; Draw this filename
    LDI r1, 4
    LDI r8, 0xCCCCCC
    LDI r4, 0x000022
    DRAWTEXT r1, r2, r0, r8, r4

    ; Advance pointer past null terminator
skip_chars:
    LOAD r7, r0
    LDI r12, 0
    CMP r7, r12
    JZ r3, skip_done
    ADD r0, r14
    JMP skip_chars

skip_done:
    ADD r0, r14             ; skip the null
    ADD r2, r15
    JMP next_file

footer:
    ; --- Footer ---
    LDI r11, 0x004400
    LDI r9, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r9, r16, r17, r18, r11

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r5, 48             ; ASCII digit for count
    STORE r20, r5
    LDI r14, 1
    ADD r20, r14
    STRO r20, " file(s)"

    LDI r1, 4
    LDI r2, 246
    LDI r0, 0x5000
    LDI r8, 0xFFFFFF
    LDI r4, 0x004400
    DRAWTEXT r1, r2, r0, r8, r4

    HALT
