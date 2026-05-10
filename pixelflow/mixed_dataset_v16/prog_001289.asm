; DESCRIPTION: Draws a magenta rectangle at (229, 66) with width 31 and height 84.
; PLAN: r0=229(x), r1=66(y), r2=31(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 66
LDI r2, 31
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
