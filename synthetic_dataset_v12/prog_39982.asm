; DESCRIPTION: Places a purple line segment connecting (383, 245) to (423, 50).
; PLAN: r0=383(x1), r1=245(y1), r2=423(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 245
LDI r2, 423
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
