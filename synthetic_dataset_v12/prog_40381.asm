; DESCRIPTION: Draws a black circle centered at (343, 73) with radius 14.
; PLAN: r0=343(x), r1=73(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 73
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
