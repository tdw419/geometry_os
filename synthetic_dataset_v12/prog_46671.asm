; DESCRIPTION: Draws a red rectangle at (147, 99) with width 42 and height 37.
; PLAN: r0=147(x), r1=99(y), r2=42(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 99
LDI r2, 42
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
