; DESCRIPTION: Draws a black line from (62, 201) to (266, 105).
; PLAN: r0=62(x1), r1=201(y1), r2=266(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 201
LDI r2, 266
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
