; DESCRIPTION: Places a purple line segment connecting (484, 135) to (44, 109).
; PLAN: r0=484(x1), r1=135(y1), r2=44(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 135
LDI r2, 44
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
