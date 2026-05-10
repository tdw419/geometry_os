; DESCRIPTION: Composite: Sets a single blue pixel at (7, 222) then Creates a blue circular shape at (287, 109) with radius 42.
; PLAN: r0=7(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=109(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 7
LDI r1, 222
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 109
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
