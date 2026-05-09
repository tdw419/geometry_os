; DESCRIPTION: Draws a magenta rectangle at (136, 91) with width 72 and height 110.
; PLAN: r0=136(x), r1=91(y), r2=72(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 91
LDI r2, 72
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
