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
    LDI r12, 0x000022
    FILL r12

    ; --- Draw title bar ---
    LDI r12, 0x000066
    LDI r8, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r12

    ; --- Title text ---
    LDI r20, 0x5000
    STRO r20, "Directory:"
    LDI r0, 4
    LDI r15, 2
    LDI r7, 0x5000
    LDI r3, 0xFFFFFF
    LDI r14, 0x000066
    DRAWTEXT r0, r15, r7, r3, r14

    ; --- Call LS to list files ---
    LDI r5, 0x5100
    LS r5                   ; r6 = entry count

    ; Store entry count at 0x7800
    LDI r13, 0x7800
    STORE r13, r6
    MOV r9, r6              ; r9 = count (safe from CMP)

    ; --- Display filenames from LS buffer ---
    ; LS writes null-terminated filenames sequentially, extra null at end
    LDI r15, 16             ; y start
    LDI r7, 0x5100         ; buffer pointer
    LDI r10, 1               ; increment
    LDI r11, 14              ; line spacing
    LDI r1, 232             ; y limit

next_file:
    CMP r15, r1
    BGE r6, footer

    ; Read first char
    LOAD r2, r7
    LDI r4, 0
    CMP r2, r4
    JZ r6, footer

    ; Draw this filename
    LDI r0, 4
    LDI r3, 0xCCCCCC
    LDI r14, 0x000022
    DRAWTEXT r0, r15, r7, r3, r14

    ; Advance pointer past null terminator
skip_chars:
    LOAD r2, r7
    LDI r4, 0
    CMP r2, r4
    JZ r6, skip_done
    ADD r7, r10
    JMP skip_chars

skip_done:
    ADD r7, r10             ; skip the null
    ADD r15, r11
    JMP next_file

footer:
    ; --- Footer ---
    LDI r12, 0x004400
    LDI r8, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r12

    ; Build count string at 0x5000
    LDI r20, 0x5000
    ADDI r9, 48             ; ASCII digit for count
    STORE r20, r9
    LDI r10, 1
    ADD r20, r10
    STRO r20, " file(s)"

    LDI r0, 4
    LDI r15, 246
    LDI r7, 0x5000
    LDI r3, 0xFFFFFF
    LDI r14, 0x004400
    DRAWTEXT r0, r15, r7, r3, r14

    HALT
