; DESCRIPTION: Renders a purple line between points (51, 201) and (33, 14).
; PLAN: r0=51(x1), r1=201(y1), r2=33(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 201
LDI r2, 33
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
