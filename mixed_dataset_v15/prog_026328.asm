; DESCRIPTION: Places a purple line segment connecting (12, 51) to (427, 148).
; PLAN: r0=12(x1), r1=51(y1), r2=427(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 51
LDI r2, 427
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
