; DESCRIPTION: Composite: Sets a single black pixel at (363, 186) then Creates a cyan circular shape at (103, 62) with radius 20.
; PLAN: r0=363(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=62(y), r7=20(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 103
LDI r6, 62
LDI r7, 20
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
