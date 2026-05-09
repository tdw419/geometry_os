; DESCRIPTION: Draws a magenta rectangle at (179, 97) with width 101 and height 94.
; PLAN: r0=179(x), r1=97(y), r2=101(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 97
LDI r2, 101
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
