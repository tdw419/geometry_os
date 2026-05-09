; DESCRIPTION: Renders a purple line between points (124, 6) and (130, 200).
; PLAN: r0=124(x1), r1=6(y1), r2=130(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 6
LDI r2, 130
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
