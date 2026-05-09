; DESCRIPTION: Composite: Sets a single red pixel at (139, 148) then Creates a magenta circular shape at (347, 32) with radius 11.
; PLAN: r0=139(x), r1=148(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=32(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 139
LDI r1, 148
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 347
LDI r6, 32
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
