; DESCRIPTION: Places a purple line segment connecting (126, 227) to (238, 80).
; PLAN: r0=126(x1), r1=227(y1), r2=238(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 227
LDI r2, 238
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
