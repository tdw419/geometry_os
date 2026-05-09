; DESCRIPTION: Draws a black circle centered at (477, 58) with radius 32.
; PLAN: r0=477(x), r1=58(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 58
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
