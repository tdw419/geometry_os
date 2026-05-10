; DESCRIPTION: Composite: Renders a black disk with center (453, 87) and radius 19 then Sets a single magenta pixel at (143, 140).
; PLAN: r0=453(x), r1=87(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=140(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 453
LDI r1, 87
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 140
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
