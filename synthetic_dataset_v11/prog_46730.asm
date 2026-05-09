; DESCRIPTION: Draws a magenta rectangle at (119, 142) with width 43 and height 26.
; PLAN: r0=119(x), r1=142(y), r2=43(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 142
LDI r2, 43
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
