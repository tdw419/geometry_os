; DESCRIPTION: Creates a black circular shape at (177, 147) with radius 78.
; PLAN: r0=177(x), r1=147(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 147
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
