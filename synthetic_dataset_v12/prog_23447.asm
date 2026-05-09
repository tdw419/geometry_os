; DESCRIPTION: Creates a black circular shape at (149, 163) with radius 37.
; PLAN: r0=149(x), r1=163(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 163
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
