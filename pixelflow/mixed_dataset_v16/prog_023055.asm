; DESCRIPTION: Composite: Creates a yellow circular shape at (452, 201) with radius 54 then Places a cyan dot at position (399, 232).
; PLAN: r0=452(x), r1=201(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=232(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 201
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 232
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
