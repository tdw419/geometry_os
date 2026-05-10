; DESCRIPTION: Draws a magenta rectangle at (106, 9) with width 31 and height 66.
; PLAN: r0=106(x), r1=9(y), r2=31(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 9
LDI r2, 31
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
