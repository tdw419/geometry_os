; DESCRIPTION: Places a purple line segment connecting (423, 58) to (37, 53).
; PLAN: r0=423(x1), r1=58(y1), r2=37(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 58
LDI r2, 37
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
