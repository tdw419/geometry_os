; DESCRIPTION: Places a purple line segment connecting (484, 11) to (90, 95).
; PLAN: r0=484(x1), r1=11(y1), r2=90(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 11
LDI r2, 90
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
