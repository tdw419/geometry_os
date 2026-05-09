; DESCRIPTION: Composite: Renders a black disk with center (416, 83) and radius 31 then Sets a single black pixel at (41, 85).
; PLAN: r0=416(x), r1=83(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=85(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 83
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 85
LDI r7, 0x000000
PSET r5, r6, r7
HALT
