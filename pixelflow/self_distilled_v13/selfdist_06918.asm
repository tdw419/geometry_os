; DESCRIPTION: Draws a magenta circle centered at (388, 31) with radius 55.
; PLAN: r0=388(x), r1=31(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 31
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
