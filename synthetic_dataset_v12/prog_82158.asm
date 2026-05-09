; DESCRIPTION: Places a purple line segment connecting (45, 185) to (484, 16).
; PLAN: r0=45(x1), r1=185(y1), r2=484(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 185
LDI r2, 484
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
