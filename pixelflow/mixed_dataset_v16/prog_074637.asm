; DESCRIPTION: Places a purple line segment connecting (355, 34) to (348, 197).
; PLAN: r0=355(x1), r1=34(y1), r2=348(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 34
LDI r2, 348
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
