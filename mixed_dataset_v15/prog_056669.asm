; DESCRIPTION: Composite: Creates a red circular shape at (235, 45) with radius 15 then Places a black dot at position (24, 72).
; PLAN: r0=235(x), r1=45(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=72(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 45
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 72
LDI r7, 0x000000
PSET r5, r6, r7
HALT
