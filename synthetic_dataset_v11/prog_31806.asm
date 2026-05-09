; DESCRIPTION: Draws a magenta rectangle at (115, 199) with width 88 and height 38.
; PLAN: r0=115(x), r1=199(y), r2=88(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 199
LDI r2, 88
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
