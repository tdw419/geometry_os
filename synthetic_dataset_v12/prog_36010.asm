; DESCRIPTION: Creates a black circular shape at (373, 177) with radius 76.
; PLAN: r0=373(x), r1=177(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 177
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
