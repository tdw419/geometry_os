; DESCRIPTION: Composite: Creates a green circular shape at (150, 218) with radius 31 then Sets a single red pixel at (125, 137).
; PLAN: r0=150(x), r1=218(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x), r6=137(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 218
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 137
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
