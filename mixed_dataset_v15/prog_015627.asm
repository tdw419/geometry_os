; DESCRIPTION: Places a purple line segment connecting (289, 51) to (133, 114).
; PLAN: r0=289(x1), r1=51(y1), r2=133(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 51
LDI r2, 133
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
