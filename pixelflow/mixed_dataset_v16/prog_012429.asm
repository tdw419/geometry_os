; DESCRIPTION: Places a blue line segment connecting (484, 204) to (266, 131).
; PLAN: r0=484(x1), r1=204(y1), r2=266(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 204
LDI r2, 266
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
