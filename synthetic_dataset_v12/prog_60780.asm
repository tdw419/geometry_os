; DESCRIPTION: Composite: Sets a single blue pixel at (179, 191) then Places a red circle of radius 65 at center (171, 130).
; PLAN: r0=179(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=130(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 179
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 130
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
