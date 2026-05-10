; DESCRIPTION: Renders a purple line between points (254, 89) and (501, 119).
; PLAN: r0=254(x1), r1=89(y1), r2=501(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 89
LDI r2, 501
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
