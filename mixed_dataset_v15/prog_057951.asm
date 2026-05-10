; DESCRIPTION: Composite: Creates a black circular shape at (477, 211) with radius 13 then Places a blue dot at position (46, 245).
; PLAN: r0=477(x), r1=211(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=245(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 477
LDI r1, 211
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 245
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
