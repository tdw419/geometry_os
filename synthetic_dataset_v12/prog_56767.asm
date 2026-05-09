; DESCRIPTION: Creates a black circular shape at (156, 204) with radius 45.
; PLAN: r0=156(x), r1=204(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 204
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
