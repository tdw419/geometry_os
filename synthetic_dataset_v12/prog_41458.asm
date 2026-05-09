; DESCRIPTION: Composite: Renders a white disk with center (426, 31) and radius 24 then Sets a single black pixel at (52, 199).
; PLAN: r0=426(x), r1=31(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=199(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 31
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 199
LDI r7, 0x000000
PSET r5, r6, r7
HALT
