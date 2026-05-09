; DESCRIPTION: Composite: Creates a white circular shape at (129, 160) with radius 15 then Sets a single black pixel at (279, 58).
; PLAN: r0=129(x), r1=160(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=58(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 160
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 58
LDI r7, 0x000000
PSET r5, r6, r7
HALT
