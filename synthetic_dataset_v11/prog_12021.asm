; DESCRIPTION: Creates a black circular shape at (142, 98) with radius 37.
; PLAN: r0=142(x), r1=98(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 98
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
