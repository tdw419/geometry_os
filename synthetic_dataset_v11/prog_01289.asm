; DESCRIPTION: Places a purple line segment connecting (204, 238) to (78, 131).
; PLAN: r0=204(x1), r1=238(y1), r2=78(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 238
LDI r2, 78
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
