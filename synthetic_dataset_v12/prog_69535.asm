; DESCRIPTION: Draws a black circle centered at (477, 165) with radius 12.
; PLAN: r0=477(x), r1=165(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 165
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
