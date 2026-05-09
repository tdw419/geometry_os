; DESCRIPTION: Renders a purple line between points (248, 155) and (221, 135).
; PLAN: r0=248(x1), r1=155(y1), r2=221(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 155
LDI r2, 221
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
