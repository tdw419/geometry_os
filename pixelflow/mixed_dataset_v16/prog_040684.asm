; DESCRIPTION: Renders a purple line between points (140, 185) and (226, 140).
; PLAN: r0=140(x1), r1=185(y1), r2=226(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 185
LDI r2, 226
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
