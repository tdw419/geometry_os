; DESCRIPTION: Composite: Sets a single red pixel at (177, 254) then Creates a black circular shape at (142, 135) with radius 50.
; PLAN: r0=177(x), r1=254(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=135(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 177
LDI r1, 254
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 142
LDI r6, 135
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
