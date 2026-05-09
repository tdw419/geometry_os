; DESCRIPTION: Draws a magenta circle centered at (169, 142) with radius 76.
; PLAN: r0=169(x), r1=142(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 142
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
