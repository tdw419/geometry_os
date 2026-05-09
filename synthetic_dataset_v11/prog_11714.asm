; DESCRIPTION: Places a purple line segment connecting (221, 72) to (254, 227).
; PLAN: r0=221(x1), r1=72(y1), r2=254(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 72
LDI r2, 254
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
