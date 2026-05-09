; DESCRIPTION: Places a blue line segment connecting (221, 140) to (163, 234).
; PLAN: r0=221(x1), r1=140(y1), r2=163(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 140
LDI r2, 163
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
