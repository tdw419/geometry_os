; DESCRIPTION: Draws a magenta circle centered at (158, 138) with radius 43.
; PLAN: r0=158(x), r1=138(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 138
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
