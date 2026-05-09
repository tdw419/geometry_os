; DESCRIPTION: Draws a magenta circle centered at (141, 72) with radius 31.
; PLAN: r0=141(x), r1=72(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 72
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
