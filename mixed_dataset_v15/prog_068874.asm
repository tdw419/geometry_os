; DESCRIPTION: Draws a magenta rectangle at (330, 110) with width 99 and height 94.
; PLAN: r0=330(x), r1=110(y), r2=99(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 110
LDI r2, 99
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
