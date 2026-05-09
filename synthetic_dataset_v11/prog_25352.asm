; DESCRIPTION: Places a purple line segment connecting (244, 193) to (56, 67).
; PLAN: r0=244(x1), r1=193(y1), r2=56(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 193
LDI r2, 56
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
