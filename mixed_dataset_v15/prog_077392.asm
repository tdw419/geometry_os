; DESCRIPTION: Composite: Creates a black circular shape at (441, 140) with radius 21 then Sets a single green pixel at (106, 137).
; PLAN: r0=441(x), r1=140(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=137(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 140
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 137
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
