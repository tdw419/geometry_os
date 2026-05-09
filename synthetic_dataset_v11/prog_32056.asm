; DESCRIPTION: Places a purple line segment connecting (137, 106) to (76, 241).
; PLAN: r0=137(x1), r1=106(y1), r2=76(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 106
LDI r2, 76
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
