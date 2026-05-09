; DESCRIPTION: Composite: Creates a black circular shape at (95, 117) with radius 52 then Places a orange dot at position (25, 109).
; PLAN: r0=95(x), r1=117(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=109(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 117
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 109
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
