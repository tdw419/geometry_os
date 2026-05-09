; DESCRIPTION: Composite: Draws a orange line from (423, 139) to (137, 248) then Sets a single white pixel at (408, 2).
; PLAN: r0=423(x1), r1=139(y1), r2=137(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=2(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 139
LDI r2, 137
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 2
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
