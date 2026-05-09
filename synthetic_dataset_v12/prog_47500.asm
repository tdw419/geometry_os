; DESCRIPTION: Creates a black circular shape at (245, 82) with radius 19.
; PLAN: r0=245(x), r1=82(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 82
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
