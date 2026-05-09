; DESCRIPTION: Renders a purple line between points (142, 21) and (241, 97).
; PLAN: r0=142(x1), r1=21(y1), r2=241(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 21
LDI r2, 241
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
