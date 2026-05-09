; DESCRIPTION: Draws a magenta rectangle at (77, 43) with width 119 and height 53.
; PLAN: r0=77(x), r1=43(y), r2=119(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 43
LDI r2, 119
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
