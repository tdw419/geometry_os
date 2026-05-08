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
    LDI r10, 0x000022
    FILL r10

    ; --- Draw title bar ---
    LDI r10, 0x000066
    LDI r14, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r14, r16, r17, r18, r10

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r15, 4
    LDI r6, 2
    LDI r3, 0x5000
    LDI r5, 0xFFFFFF
    LDI r0, 0x000066
    DRAWTEXT r15, r6, r3, r5, r0

    ; --- Call LS to list files ---
    LDI r12, 0x5100
    LS r12                   ; r11 = entry count

    ; Store entry count at 0x7800
    LDI r9, 0x7800
    STORE r9, r11
    MOV r2, r11              ; r2 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r6, 16             ; y start
    LDI r3, 0x5100         ; buffer pointer
    LDI r1, 1               ; increment
    LDI r7, 14              ; line spacing
    LDI r13, 232             ; y limit

next_file:
    CMP r6, r13
    BGE r11, footer

    ; Read first char
    LOAD r8, r3
    LDI r4, 0
    CMP r8, r4
    JZ r11, footer

    ; Draw this filename
    LDI r15, 4
    LDI r5, 0xCCCCCC
    LDI r0, 0x000022
    DRAWTEXT r15, r6, r3, r5, r0

    ; Advance pointer past null terminator
skip_chars:
    LOAD r8, r3
    LDI r4, 0
    CMP r8, r4
    JZ r11, skip_done
    ADD r3, r1
    JMP skip_chars

skip_done:
    ADD r3, r1             ; skip the null
    ADD r6, r7
    JMP next_file

footer:
    ; --- Footer ---
    LDI r10, 0x004400
    LDI r14, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r14, r16, r17, r18, r10

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r2, 48             ; ASCII digit for count
    STORE r20, r2
    LDI r1, 1
    ADD r20, r1
    STRO r20, " file(s)"

    LDI r15, 4
    LDI r6, 246
    LDI r3, 0x5000
    LDI r5, 0xFFFFFF
    LDI r0, 0x004400
    DRAWTEXT r15, r6, r3, r5, r0

    HALT
