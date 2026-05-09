; DESCRIPTION: Draws a black circle centered at (343, 95) with radius 24.
; PLAN: r0=343(x), r1=95(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 95
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
