; DESCRIPTION: Composite: Places a yellow line segment connecting (391, 4) to (402, 162) then Sets a single red pixel at (458, 110).
; PLAN: r0=391(x1), r1=4(y1), r2=402(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=110(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 391
LDI r1, 4
LDI r2, 402
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 110
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
