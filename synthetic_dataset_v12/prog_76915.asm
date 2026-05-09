; DESCRIPTION: Composite: Sets a single cyan pixel at (435, 7) then Creates a black circular shape at (319, 63) with radius 56.
; PLAN: r0=435(x), r1=7(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=63(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 435
LDI r1, 7
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 63
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
