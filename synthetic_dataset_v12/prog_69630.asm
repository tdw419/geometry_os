; DESCRIPTION: Draws a magenta circle centered at (84, 167) with radius 29.
; PLAN: r0=84(x), r1=167(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 167
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
