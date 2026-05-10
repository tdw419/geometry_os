; DESCRIPTION: Draws a magenta circle centered at (322, 178) with radius 45.
; PLAN: r0=322(x), r1=178(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 178
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
