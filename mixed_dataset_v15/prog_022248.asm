; DESCRIPTION: Places a purple line segment connecting (87, 131) to (364, 157).
; PLAN: r0=87(x1), r1=131(y1), r2=364(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 131
LDI r2, 364
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
