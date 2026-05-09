; DESCRIPTION: Renders a purple line between points (389, 13) and (378, 225).
; PLAN: r0=389(x1), r1=13(y1), r2=378(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 13
LDI r2, 378
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
