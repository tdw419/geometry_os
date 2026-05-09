; DESCRIPTION: Places a blue line segment connecting (193, 49) to (108, 118).
; PLAN: r0=193(x1), r1=49(y1), r2=108(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 49
LDI r2, 108
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
