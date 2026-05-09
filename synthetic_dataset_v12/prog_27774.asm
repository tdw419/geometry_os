; DESCRIPTION: Places a blue line segment connecting (326, 92) to (366, 247).
; PLAN: r0=326(x1), r1=92(y1), r2=366(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 92
LDI r2, 366
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
