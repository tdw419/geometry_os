; DESCRIPTION: Renders a purple line between points (369, 119) and (342, 105).
; PLAN: r0=369(x1), r1=119(y1), r2=342(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 119
LDI r2, 342
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
