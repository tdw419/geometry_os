; DESCRIPTION: Creates a black circular shape at (341, 82) with radius 73.
; PLAN: r0=341(x), r1=82(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 82
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
