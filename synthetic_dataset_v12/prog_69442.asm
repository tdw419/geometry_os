; DESCRIPTION: Composite: Renders a blue line between points (496, 183) and (217, 68) then Sets a single blue pixel at (402, 190).
; PLAN: r0=496(x1), r1=183(y1), r2=217(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=190(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 496
LDI r1, 183
LDI r2, 217
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 190
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
