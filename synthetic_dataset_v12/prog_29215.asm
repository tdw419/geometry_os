; DESCRIPTION: Places a purple line segment connecting (88, 142) to (238, 38).
; PLAN: r0=88(x1), r1=142(y1), r2=238(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 142
LDI r2, 238
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
