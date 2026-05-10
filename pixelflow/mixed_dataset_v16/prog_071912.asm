; DESCRIPTION: Places a purple line segment connecting (489, 101) to (145, 96).
; PLAN: r0=489(x1), r1=101(y1), r2=145(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 101
LDI r2, 145
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
