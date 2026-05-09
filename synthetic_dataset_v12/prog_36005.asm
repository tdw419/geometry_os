; DESCRIPTION: Places a purple line segment connecting (73, 158) to (231, 53).
; PLAN: r0=73(x1), r1=158(y1), r2=231(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 158
LDI r2, 231
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
