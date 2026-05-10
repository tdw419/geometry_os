; DESCRIPTION: Renders a purple line between points (428, 193) and (453, 226).
; PLAN: r0=428(x1), r1=193(y1), r2=453(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 193
LDI r2, 453
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
