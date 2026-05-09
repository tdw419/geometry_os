; DESCRIPTION: Draws a magenta rectangle at (97, 132) with width 54 and height 63.
; PLAN: r0=97(x), r1=132(y), r2=54(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 132
LDI r2, 54
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
