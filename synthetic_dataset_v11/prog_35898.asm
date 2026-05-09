; DESCRIPTION: Draws a green rectangle at (147, 118) with width 101 and height 111.
; PLAN: r0=147(x), r1=118(y), r2=101(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 118
LDI r2, 101
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
