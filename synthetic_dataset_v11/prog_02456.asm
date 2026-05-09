; DESCRIPTION: Creates a black circular shape at (109, 195) with radius 31.
; PLAN: r0=109(x), r1=195(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 195
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
