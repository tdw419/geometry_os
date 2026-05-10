; DESCRIPTION: Composite: Sets a single orange pixel at (439, 191) then Draws a purple circle centered at (239, 111) with radius 49.
; PLAN: r0=439(x), r1=191(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=111(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 191
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 239
LDI r6, 111
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
