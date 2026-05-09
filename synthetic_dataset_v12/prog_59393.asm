; DESCRIPTION: Places a purple line segment connecting (468, 217) to (158, 86).
; PLAN: r0=468(x1), r1=217(y1), r2=158(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 217
LDI r2, 158
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
