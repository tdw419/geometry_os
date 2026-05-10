; DESCRIPTION: Renders a purple line between points (26, 136) and (251, 26).
; PLAN: r0=26(x1), r1=136(y1), r2=251(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 136
LDI r2, 251
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
