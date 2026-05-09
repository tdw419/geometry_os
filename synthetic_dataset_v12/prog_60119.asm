; DESCRIPTION: Renders a purple line between points (315, 0) and (385, 185).
; PLAN: r0=315(x1), r1=0(y1), r2=385(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 0
LDI r2, 385
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
