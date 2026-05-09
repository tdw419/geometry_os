; DESCRIPTION: Composite: Creates a red circular shape at (217, 88) with radius 35 then Sets a single black pixel at (508, 149).
; PLAN: r0=217(x), r1=88(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=508(x), r6=149(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 217
LDI r1, 88
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 508
LDI r6, 149
LDI r7, 0x000000
PSET r5, r6, r7
HALT
