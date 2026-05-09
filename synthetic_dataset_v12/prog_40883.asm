; DESCRIPTION: Draws a magenta rectangle at (94, 159) with width 11 and height 73.
; PLAN: r0=94(x), r1=159(y), r2=11(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 159
LDI r2, 11
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
