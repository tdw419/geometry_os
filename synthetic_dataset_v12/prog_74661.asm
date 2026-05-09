; DESCRIPTION: Renders a blue line between points (115, 227) and (448, 124).
; PLAN: r0=115(x1), r1=227(y1), r2=448(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 227
LDI r2, 448
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
