; DESCRIPTION: Draws a blue line from (109, 241) to (227, 201).
; PLAN: r0=109(x1), r1=241(y1), r2=227(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 241
LDI r2, 227
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
