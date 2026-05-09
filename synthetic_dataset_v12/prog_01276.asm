; DESCRIPTION: Composite: Draws a black circle centered at (368, 51) with radius 12 then Sets a single black pixel at (281, 180).
; PLAN: r0=368(x), r1=51(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=180(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 51
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 180
LDI r7, 0x000000
PSET r5, r6, r7
HALT
