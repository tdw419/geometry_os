; DESCRIPTION: Places a blue line segment connecting (484, 25) to (471, 59).
; PLAN: r0=484(x1), r1=25(y1), r2=471(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 25
LDI r2, 471
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
