; DESCRIPTION: Draws a black circle centered at (167, 73) with radius 45.
; PLAN: r0=167(x), r1=73(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 73
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
