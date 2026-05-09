; DESCRIPTION: Places a purple line segment connecting (110, 23) to (500, 212).
; PLAN: r0=110(x1), r1=23(y1), r2=500(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 23
LDI r2, 500
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
