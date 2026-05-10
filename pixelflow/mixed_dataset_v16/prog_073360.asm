; DESCRIPTION: Places a blue line segment connecting (337, 11) to (483, 78).
; PLAN: r0=337(x1), r1=11(y1), r2=483(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 11
LDI r2, 483
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
