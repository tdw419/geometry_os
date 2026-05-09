; DESCRIPTION: Composite: Sets a single blue pixel at (115, 240) then Creates a cyan circular shape at (28, 89) with radius 10.
; PLAN: r0=115(x), r1=240(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=28(x), r6=89(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 115
LDI r1, 240
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 28
LDI r6, 89
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
