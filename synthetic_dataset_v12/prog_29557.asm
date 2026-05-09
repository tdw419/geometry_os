; DESCRIPTION: Places a blue line segment connecting (52, 238) to (389, 85).
; PLAN: r0=52(x1), r1=238(y1), r2=389(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 238
LDI r2, 389
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
