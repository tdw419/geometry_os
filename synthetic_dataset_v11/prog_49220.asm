; DESCRIPTION: Renders a purple line between points (169, 118) and (39, 160).
; PLAN: r0=169(x1), r1=118(y1), r2=39(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 118
LDI r2, 39
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
