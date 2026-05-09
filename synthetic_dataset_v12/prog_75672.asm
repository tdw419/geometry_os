; DESCRIPTION: Composite: Creates a red circular shape at (356, 114) with radius 19 then Places a black dot at position (461, 169).
; PLAN: r0=356(x), r1=114(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x), r6=169(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 114
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 169
LDI r7, 0x000000
PSET r5, r6, r7
HALT
