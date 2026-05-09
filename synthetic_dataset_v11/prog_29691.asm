; DESCRIPTION: Renders a purple line between points (31, 225) and (158, 119).
; PLAN: r0=31(x1), r1=225(y1), r2=158(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 225
LDI r2, 158
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
