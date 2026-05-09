; DESCRIPTION: Places a blue line segment connecting (133, 140) to (339, 158).
; PLAN: r0=133(x1), r1=140(y1), r2=339(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 140
LDI r2, 339
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
