; DESCRIPTION: Places a blue line segment connecting (140, 163) to (76, 87).
; PLAN: r0=140(x1), r1=163(y1), r2=76(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 163
LDI r2, 76
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
