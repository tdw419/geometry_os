; DESCRIPTION: Composite: Sets a single black pixel at (90, 20) then Creates a cyan circular shape at (118, 90) with radius 40.
; PLAN: r0=90(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=90(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 90
LDI r1, 20
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 90
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
