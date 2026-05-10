; DESCRIPTION: Places a blue line segment connecting (377, 218) to (244, 9).
; PLAN: r0=377(x1), r1=218(y1), r2=244(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 218
LDI r2, 244
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
