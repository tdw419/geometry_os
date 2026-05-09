; DESCRIPTION: Composite: Creates a purple circular shape at (197, 106) with radius 21 then Places a orange dot at position (321, 191).
; PLAN: r0=197(x), r1=106(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=191(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 197
LDI r1, 106
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 191
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
