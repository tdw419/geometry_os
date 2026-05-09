; DESCRIPTION: Composite: Sets a single blue pixel at (495, 246) then Creates a green circular shape at (73, 180) with radius 21.
; PLAN: r0=495(x), r1=246(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=180(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 495
LDI r1, 246
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 180
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
