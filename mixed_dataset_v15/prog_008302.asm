; DESCRIPTION: Composite: Sets a single green pixel at (506, 56) then Creates a purple circular shape at (56, 138) with radius 43.
; PLAN: r0=506(x), r1=56(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=138(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 506
LDI r1, 56
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 56
LDI r6, 138
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
