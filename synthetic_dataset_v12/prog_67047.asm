; DESCRIPTION: Draws a magenta rectangle at (132, 99) with width 63 and height 99.
; PLAN: r0=132(x), r1=99(y), r2=63(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 99
LDI r2, 63
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
