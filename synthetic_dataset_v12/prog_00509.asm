; DESCRIPTION: Draws a magenta rectangle at (291, 83) with width 118 and height 73.
; PLAN: r0=291(x), r1=83(y), r2=118(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 83
LDI r2, 118
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
