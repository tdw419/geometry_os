; DESCRIPTION: Composite: Renders a white disk with center (93, 79) and radius 73 then Places a yellow dot at position (361, 238).
; PLAN: r0=93(x), r1=79(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=238(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 79
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 238
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
