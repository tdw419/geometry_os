; DESCRIPTION: Places a purple line segment connecting (498, 218) to (325, 112).
; PLAN: r0=498(x1), r1=218(y1), r2=325(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 218
LDI r2, 325
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
