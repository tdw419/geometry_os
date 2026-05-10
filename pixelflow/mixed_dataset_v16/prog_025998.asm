; DESCRIPTION: Composite: Creates a orange circular shape at (293, 99) with radius 65 then Places a black dot at position (458, 230).
; PLAN: r0=293(x), r1=99(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x), r6=230(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 99
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 230
LDI r7, 0x000000
PSET r5, r6, r7
HALT
