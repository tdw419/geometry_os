; DESCRIPTION: Draws a magenta rectangle at (78, 2) with width 56 and height 89.
; PLAN: r0=78(x), r1=2(y), r2=56(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 2
LDI r2, 56
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
