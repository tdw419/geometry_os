; DESCRIPTION: Draws a magenta rectangle at (5, 155) with width 97 and height 57.
; PLAN: r0=5(x), r1=155(y), r2=97(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 155
LDI r2, 97
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
