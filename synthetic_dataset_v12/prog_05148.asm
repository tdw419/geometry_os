; DESCRIPTION: Draws a magenta rectangle at (56, 34) with width 110 and height 63.
; PLAN: r0=56(x), r1=34(y), r2=110(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 34
LDI r2, 110
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
