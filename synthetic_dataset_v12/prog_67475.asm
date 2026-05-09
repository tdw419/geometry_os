; DESCRIPTION: Draws a purple circle centered at (343, 218) with radius 19.
; PLAN: r0=343(x), r1=218(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 218
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
