; DESCRIPTION: Composite: Renders a blue disk with center (316, 155) and radius 68 then Sets a single blue pixel at (17, 1).
; PLAN: r0=316(x), r1=155(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=1(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 155
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 1
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
