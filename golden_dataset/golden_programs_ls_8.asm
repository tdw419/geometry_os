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
    LDI r15, 0x000022
    FILL r15

    ; --- Draw title bar ---
    LDI r15, 0x000066
    LDI r2, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r2, r16, r17, r18, r15

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r6, 4
    LDI r11, 2
    LDI r7, 0x5000
    LDI r9, 0xFFFFFF
    LDI r12, 0x000066
    DRAWTEXT r6, r11, r7, r9, r12

    ; --- Call LS to list files ---
    LDI r0, 0x5100
    LS r0                   ; r14 = entry count

    ; Store entry count at 0x7800
    LDI r4, 0x7800
    STORE r4, r14
    MOV r5, r14              ; r5 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r11, 16             ; y start
    LDI r7, 0x5100         ; buffer pointer
    LDI r8, 1               ; increment
    LDI r3, 14              ; line spacing
    LDI r10, 232             ; y limit

next_file:
    CMP r11, r10
    BGE r14, footer

    ; Read first char
    LOAD r13, r7
    LDI r1, 0
    CMP r13, r1
    JZ r14, footer

    ; Draw this filename
    LDI r6, 4
    LDI r9, 0xCCCCCC
    LDI r12, 0x000022
    DRAWTEXT r6, r11, r7, r9, r12

    ; Advance pointer past null terminator
skip_chars:
    LOAD r13, r7
    LDI r1, 0
    CMP r13, r1
    JZ r14, skip_done
    ADD r7, r8
    JMP skip_chars

skip_done:
    ADD r7, r8             ; skip the null
    ADD r11, r3
    JMP next_file

footer:
    ; --- Footer ---
    LDI r15, 0x004400
    LDI r2, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r2, r16, r17, r18, r15

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r5, 48             ; ASCII digit for count
    STORE r20, r5
    LDI r8, 1
    ADD r20, r8
    STRO r20, " file(s)"

    LDI r6, 4
    LDI r11, 246
    LDI r7, 0x5000
    LDI r9, 0xFFFFFF
    LDI r12, 0x004400
    DRAWTEXT r6, r11, r7, r9, r12

    HALT
