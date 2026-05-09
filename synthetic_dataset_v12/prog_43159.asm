; DESCRIPTION: Composite: Renders a yellow disk with center (396, 60) and radius 56 then Sets a single blue pixel at (147, 202).
; PLAN: r0=396(x), r1=60(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=202(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 60
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 202
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
