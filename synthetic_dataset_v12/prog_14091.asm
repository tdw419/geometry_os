; DESCRIPTION: Composite: Renders a black disk with center (93, 61) and radius 18 then Sets a single yellow pixel at (38, 82).
; PLAN: r0=93(x), r1=61(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=82(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 61
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 82
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
