; DESCRIPTION: Renders a purple line between points (272, 112) and (147, 201).
; PLAN: r0=272(x1), r1=112(y1), r2=147(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 112
LDI r2, 147
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
