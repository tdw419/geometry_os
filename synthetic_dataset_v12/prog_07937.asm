; DESCRIPTION: Places a purple line segment connecting (477, 1) to (234, 60).
; PLAN: r0=477(x1), r1=1(y1), r2=234(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 1
LDI r2, 234
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
