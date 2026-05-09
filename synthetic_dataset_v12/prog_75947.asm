; DESCRIPTION: Renders a purple line between points (279, 140) and (189, 185).
; PLAN: r0=279(x1), r1=140(y1), r2=189(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 140
LDI r2, 189
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
