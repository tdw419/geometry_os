; DESCRIPTION: Composite: Sets a single red pixel at (308, 201) then Places a orange circle of radius 31 at center (332, 212).
; PLAN: r0=308(x), r1=201(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=212(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 201
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 332
LDI r6, 212
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
