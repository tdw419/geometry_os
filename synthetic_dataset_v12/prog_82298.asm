; DESCRIPTION: Draws a green rectangle at (147, 28) with width 87 and height 87.
; PLAN: r0=147(x), r1=28(y), r2=87(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 28
LDI r2, 87
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
