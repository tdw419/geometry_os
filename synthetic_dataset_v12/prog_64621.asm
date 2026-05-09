; DESCRIPTION: Places a purple line segment connecting (211, 105) to (51, 144).
; PLAN: r0=211(x1), r1=105(y1), r2=51(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 105
LDI r2, 51
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
