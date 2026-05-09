; DESCRIPTION: Draws a magenta circle centered at (142, 69) with radius 66.
; PLAN: r0=142(x), r1=69(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 69
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
