; DESCRIPTION: Draws a magenta rectangle at (158, 78) with width 79 and height 33.
; PLAN: r0=158(x), r1=78(y), r2=79(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 78
LDI r2, 79
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
