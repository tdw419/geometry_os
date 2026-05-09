; DESCRIPTION: Composite: Creates a black circular shape at (437, 240) with radius 16 then Places a orange dot at position (41, 57).
; PLAN: r0=437(x), r1=240(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=57(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 240
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 57
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
