; DESCRIPTION: Draws a orange line from (478, 211) to (265, 201).
; PLAN: r0=478(x1), r1=211(y1), r2=265(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 211
LDI r2, 265
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
