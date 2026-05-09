; DESCRIPTION: Draws a magenta rectangle at (343, 119) with width 53 and height 110.
; PLAN: r0=343(x), r1=119(y), r2=53(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 119
LDI r2, 53
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
