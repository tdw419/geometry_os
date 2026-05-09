; DESCRIPTION: Composite: Creates a black circular shape at (452, 73) with radius 27 then Places a white dot at position (112, 170).
; PLAN: r0=452(x), r1=73(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x), r6=170(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 73
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 170
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
