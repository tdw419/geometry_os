; DESCRIPTION: Composite: Sets a single yellow pixel at (451, 156) then Draws a cyan circle centered at (454, 90) with radius 30.
; PLAN: r0=451(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=90(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 451
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 454
LDI r6, 90
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
