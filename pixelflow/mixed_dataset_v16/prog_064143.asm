; DESCRIPTION: Composite: Places a orange circle of radius 54 at center (109, 144) then Sets a single orange pixel at (498, 52).
; PLAN: r0=109(x), r1=144(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=52(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 144
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 52
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
