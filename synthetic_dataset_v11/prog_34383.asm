; DESCRIPTION: Places a purple line segment connecting (88, 52) to (93, 241).
; PLAN: r0=88(x1), r1=52(y1), r2=93(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 52
LDI r2, 93
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
