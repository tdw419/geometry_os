; DESCRIPTION: Composite: Places a white line segment connecting (316, 4) to (339, 177) then Sets a single orange pixel at (484, 92).
; PLAN: r0=316(x1), r1=4(y1), r2=339(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=92(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 4
LDI r2, 339
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 92
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
