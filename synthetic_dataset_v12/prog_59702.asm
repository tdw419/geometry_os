; DESCRIPTION: Draws a magenta circle centered at (88, 177) with radius 53.
; PLAN: r0=88(x), r1=177(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 177
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
