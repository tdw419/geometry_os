; DESCRIPTION: Places a purple line segment connecting (104, 171) to (484, 34).
; PLAN: r0=104(x1), r1=171(y1), r2=484(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 171
LDI r2, 484
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
