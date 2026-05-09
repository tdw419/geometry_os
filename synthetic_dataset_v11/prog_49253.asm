; DESCRIPTION: Places a purple line segment connecting (133, 78) to (15, 163).
; PLAN: r0=133(x1), r1=78(y1), r2=15(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 78
LDI r2, 15
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
