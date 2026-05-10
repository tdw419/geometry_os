; DESCRIPTION: Draws a magenta rectangle at (44, 153) with width 118 and height 43.
; PLAN: r0=44(x), r1=153(y), r2=118(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 153
LDI r2, 118
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
