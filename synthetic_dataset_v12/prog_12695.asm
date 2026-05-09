; DESCRIPTION: Renders a purple line between points (92, 201) and (84, 54).
; PLAN: r0=92(x1), r1=201(y1), r2=84(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 201
LDI r2, 84
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
