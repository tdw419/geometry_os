; DESCRIPTION: Draws a black line from (318, 223) to (378, 201).
; PLAN: r0=318(x1), r1=223(y1), r2=378(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 223
LDI r2, 378
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
