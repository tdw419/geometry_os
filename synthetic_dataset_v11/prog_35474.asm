; DESCRIPTION: Places a purple line segment connecting (133, 34) to (4, 173).
; PLAN: r0=133(x1), r1=34(y1), r2=4(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 34
LDI r2, 4
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
