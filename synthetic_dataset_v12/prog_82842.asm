; DESCRIPTION: Composite: Sets a single red pixel at (511, 126) then Creates a black circular shape at (400, 83) with radius 44.
; PLAN: r0=511(x), r1=126(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=83(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 511
LDI r1, 126
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 83
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
