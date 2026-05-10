; DESCRIPTION: Places a purple line segment connecting (15, 41) to (141, 218).
; PLAN: r0=15(x1), r1=41(y1), r2=141(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 41
LDI r2, 141
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
