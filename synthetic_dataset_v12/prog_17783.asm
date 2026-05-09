; DESCRIPTION: Places a purple line segment connecting (232, 15) to (468, 130).
; PLAN: r0=232(x1), r1=15(y1), r2=468(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 15
LDI r2, 468
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
