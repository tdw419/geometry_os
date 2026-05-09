; DESCRIPTION: Places a purple line segment connecting (122, 8) to (427, 80).
; PLAN: r0=122(x1), r1=8(y1), r2=427(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 8
LDI r2, 427
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
