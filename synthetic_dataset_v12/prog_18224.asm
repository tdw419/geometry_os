; DESCRIPTION: Places a purple line segment connecting (457, 24) to (335, 254).
; PLAN: r0=457(x1), r1=24(y1), r2=335(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 24
LDI r2, 335
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
