; DESCRIPTION: Creates a black circular shape at (155, 152) with radius 31.
; PLAN: r0=155(x), r1=152(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 152
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
