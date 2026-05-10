; DESCRIPTION: Renders a purple line between points (169, 163) and (158, 119).
; PLAN: r0=169(x1), r1=163(y1), r2=158(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 163
LDI r2, 158
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
