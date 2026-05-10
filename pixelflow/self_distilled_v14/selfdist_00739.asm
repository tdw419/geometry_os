; DESCRIPTION: Draws a magenta rectangle at (381, 65) with width 94 and height 40.
; PLAN: r0=381(x), r1=65(y), r2=94(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 65
LDI r2, 94
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
