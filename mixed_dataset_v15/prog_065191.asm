; DESCRIPTION: Composite: Places a red line segment connecting (492, 71) to (342, 177) then Sets a single blue pixel at (325, 86).
; PLAN: r0=492(x1), r1=71(y1), r2=342(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=86(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 492
LDI r1, 71
LDI r2, 342
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 86
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
