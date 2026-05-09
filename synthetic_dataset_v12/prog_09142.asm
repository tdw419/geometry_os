; DESCRIPTION: Composite: Places a yellow circle of radius 10 at center (494, 207) then Sets a single black pixel at (471, 138).
; PLAN: r0=494(x), r1=207(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x), r6=138(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 494
LDI r1, 207
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 138
LDI r7, 0x000000
PSET r5, r6, r7
HALT
