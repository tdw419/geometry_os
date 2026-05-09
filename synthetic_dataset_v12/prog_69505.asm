; DESCRIPTION: Draws a magenta rectangle at (110, 106) with width 43 and height 71.
; PLAN: r0=110(x), r1=106(y), r2=43(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 106
LDI r2, 43
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
