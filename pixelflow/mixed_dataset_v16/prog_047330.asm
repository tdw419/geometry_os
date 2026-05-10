; DESCRIPTION: Composite: Sets a single purple pixel at (22, 136) then Creates a black circular shape at (438, 91) with radius 11.
; PLAN: r0=22(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=91(y), r7=11(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 91
LDI r7, 11
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
