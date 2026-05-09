; DESCRIPTION: Composite: Places a purple line segment connecting (491, 199) to (385, 7) then Sets a single yellow pixel at (457, 11).
; PLAN: r0=491(x1), r1=199(y1), r2=385(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=11(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 491
LDI r1, 199
LDI r2, 385
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 11
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
