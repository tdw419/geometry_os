; DESCRIPTION: Composite: Renders a yellow disk with center (369, 94) and radius 79 then Sets a single magenta pixel at (325, 79).
; PLAN: r0=369(x), r1=94(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=79(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 94
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 79
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
