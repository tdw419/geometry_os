; DESCRIPTION: Composite: Places a orange circle of radius 11 at center (51, 204) then Places a purple dot at position (376, 44).
; PLAN: r0=51(x), r1=204(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=44(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 51
LDI r1, 204
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 44
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
