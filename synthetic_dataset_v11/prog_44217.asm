; DESCRIPTION: Draws a magenta rectangle at (141, 34) with width 68 and height 43.
; PLAN: r0=141(x), r1=34(y), r2=68(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 34
LDI r2, 68
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
