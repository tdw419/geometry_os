; vw_font_demo.asm -- Variable-width font rendering demo
; Demonstrates VWTXT (0xDB) opcode with proportional text
;
; Visual verification:
; - Line 1: White on dark blue background "Variable Width!"
; - Line 2: Green transparent bg "iiiMMMiiiMMMiii" (narrow vs wide)
; - Line 3: Orange transparent bg "Hello World 0123"
; - Line 4: Cyan with bg "The quick brown fox"

    LDI r10, 5          ; x = 5
    LDI r11, 5          ; y = 5
    LDI r12, msg1       ; addr = msg1
    LDI r13, 0xFFFFFF   ; fg = white
    LDI r14, 0x000033   ; bg = dark blue
    VWTXT r10, r11, r12, r13, r14

    LDI r11, 25         ; y = 25 (line 2)
    LDI r12, msg2
    LDI r13, 0x00FF00   ; fg = green
    LDI r14, 0          ; bg = transparent
    VWTXT r10, r11, r12, r13, r14

    LDI r11, 45         ; y = 45 (line 3)
    LDI r12, msg3
    LDI r13, 0xFFAA00   ; fg = orange
    VWTXT r10, r11, r12, r13, r14

    LDI r11, 65         ; y = 65 (line 4)
    LDI r12, msg4
    LDI r13, 0x00FFFF   ; fg = cyan
    LDI r14, 0x001122   ; bg = dark teal
    VWTXT r10, r11, r12, r13, r14

    HALT

msg1: "Variable Width!"
msg2: "iiiMMMiiiMMMiii"
msg3: "Hello World 0123"
msg4: "The quick brown fox"
