; DESCRIPTION: Draws a magenta circle centered at (74, 136) with radius 33.
; PLAN: r0=74(x), r1=136(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 136
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
