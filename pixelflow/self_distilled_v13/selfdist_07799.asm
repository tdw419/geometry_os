; DESCRIPTION: Draws a magenta circle centered at (40, 181) with radius 69.
; PLAN: r0=40(x), r1=181(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 181
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
