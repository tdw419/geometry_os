; DESCRIPTION: Draws a green rectangle at (147, 198) with width 86 and height 13.
; PLAN: r0=147(x), r1=198(y), r2=86(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 198
LDI r2, 86
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
