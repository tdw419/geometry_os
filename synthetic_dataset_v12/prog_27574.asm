; DESCRIPTION: Composite: Sets a single black pixel at (475, 218) then Draws a yellow line from (199, 70) to (427, 200).
; PLAN: r0=475(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=199(x1), r6=70(y1), r7=427(x2), r8=200(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 199
LDI r6, 70
LDI r7, 427
LDI r8, 200
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
