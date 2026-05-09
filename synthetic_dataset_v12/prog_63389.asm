; DESCRIPTION: Renders a purple line between points (347, 131) and (457, 170).
; PLAN: r0=347(x1), r1=131(y1), r2=457(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 131
LDI r2, 457
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
