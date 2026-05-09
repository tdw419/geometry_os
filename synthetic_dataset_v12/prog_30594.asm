; DESCRIPTION: Renders a purple line between points (368, 227) and (78, 250).
; PLAN: r0=368(x1), r1=227(y1), r2=78(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 227
LDI r2, 78
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
