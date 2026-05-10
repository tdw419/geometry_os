; DESCRIPTION: Composite: Creates a green circular shape at (366, 102) with radius 75 then Places a black dot at position (140, 52).
; PLAN: r0=366(x), r1=102(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=52(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 102
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 52
LDI r7, 0x000000
PSET r5, r6, r7
HALT
