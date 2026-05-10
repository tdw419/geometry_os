; DESCRIPTION: Draws a magenta rectangle at (172, 20) with width 119 and height 88.
; PLAN: r0=172(x), r1=20(y), r2=119(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 20
LDI r2, 119
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
