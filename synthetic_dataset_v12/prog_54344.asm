; DESCRIPTION: Places a purple line segment connecting (332, 198) to (80, 119).
; PLAN: r0=332(x1), r1=198(y1), r2=80(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 198
LDI r2, 80
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
