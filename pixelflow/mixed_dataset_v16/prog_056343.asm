; DESCRIPTION: Composite: Renders a red disk with center (133, 98) and radius 31 then Sets a single orange pixel at (129, 227).
; PLAN: r0=133(x), r1=98(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=227(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 133
LDI r1, 98
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 227
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
