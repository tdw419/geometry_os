; DESCRIPTION: Composite: Draws a purple line from (321, 8) to (130, 3) then Sets a single white pixel at (312, 159).
; PLAN: r0=321(x1), r1=8(y1), r2=130(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=159(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 8
LDI r2, 130
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 159
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
