; DESCRIPTION: Draws a magenta circle centered at (347, 69) with radius 64.
; PLAN: r0=347(x), r1=69(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 69
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
