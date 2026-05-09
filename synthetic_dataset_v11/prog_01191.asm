; DESCRIPTION: Places a purple line segment connecting (201, 78) to (202, 36).
; PLAN: r0=201(x1), r1=78(y1), r2=202(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 78
LDI r2, 202
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
