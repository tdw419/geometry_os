; DESCRIPTION: Creates a black circular shape at (163, 144) with radius 71.
; PLAN: r0=163(x), r1=144(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 144
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
