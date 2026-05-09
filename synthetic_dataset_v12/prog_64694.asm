; DESCRIPTION: Draws a magenta rectangle at (8, 91) with width 20 and height 110.
; PLAN: r0=8(x), r1=91(y), r2=20(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 91
LDI r2, 20
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
