; DESCRIPTION: Draws a magenta circle centered at (399, 69) with radius 43.
; PLAN: r0=399(x), r1=69(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 69
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
