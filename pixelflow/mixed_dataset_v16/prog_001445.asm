; DESCRIPTION: Composite: Creates a white circular shape at (275, 82) with radius 58 then Sets a single yellow pixel at (104, 86).
; PLAN: r0=275(x), r1=82(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=86(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 82
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 86
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
