; DESCRIPTION: Composite: Sets a single blue pixel at (413, 98) then Creates a white circular shape at (452, 32) with radius 29.
; PLAN: r0=413(x), r1=98(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=452(x), r6=32(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 413
LDI r1, 98
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 452
LDI r6, 32
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
