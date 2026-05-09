; DESCRIPTION: Draws a magenta rectangle at (49, 8) with width 68 and height 106.
; PLAN: r0=49(x), r1=8(y), r2=68(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 8
LDI r2, 68
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
