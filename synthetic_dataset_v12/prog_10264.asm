; DESCRIPTION: Places a purple line segment connecting (95, 218) to (314, 250).
; PLAN: r0=95(x1), r1=218(y1), r2=314(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 218
LDI r2, 314
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
