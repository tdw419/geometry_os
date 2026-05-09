; DESCRIPTION: Renders a purple line between points (449, 169) and (478, 220).
; PLAN: r0=449(x1), r1=169(y1), r2=478(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 169
LDI r2, 478
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
