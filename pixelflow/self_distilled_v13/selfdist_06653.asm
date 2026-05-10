; DESCRIPTION: Draws a magenta circle centered at (141, 137) with radius 70.
; PLAN: r0=141(x), r1=137(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 137
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
