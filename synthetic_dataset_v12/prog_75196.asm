; DESCRIPTION: Composite: Renders a black disk with center (145, 80) and radius 75 then Sets a single yellow pixel at (54, 147).
; PLAN: r0=145(x), r1=80(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=147(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 80
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 147
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
