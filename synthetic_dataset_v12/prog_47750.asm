; DESCRIPTION: Renders a purple line between points (44, 75) and (448, 144).
; PLAN: r0=44(x1), r1=75(y1), r2=448(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 75
LDI r2, 448
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
