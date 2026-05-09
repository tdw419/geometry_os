; DESCRIPTION: Composite: Draws a white line from (353, 3) to (248, 56) then Sets a single red pixel at (179, 12).
; PLAN: r0=353(x1), r1=3(y1), r2=248(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=12(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 3
LDI r2, 248
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 12
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
