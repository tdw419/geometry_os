; DESCRIPTION: Composite: Creates a black circular shape at (283, 149) with radius 26 then Sets a single yellow pixel at (124, 30).
; PLAN: r0=283(x), r1=149(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=30(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 149
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 30
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
