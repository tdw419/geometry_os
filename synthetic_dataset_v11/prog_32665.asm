; DESCRIPTION: Renders a purple line between points (44, 218) and (189, 201).
; PLAN: r0=44(x1), r1=218(y1), r2=189(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 218
LDI r2, 189
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
