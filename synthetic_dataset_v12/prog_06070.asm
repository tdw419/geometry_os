; DESCRIPTION: Places a blue line segment connecting (20, 142) to (391, 238).
; PLAN: r0=20(x1), r1=142(y1), r2=391(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 142
LDI r2, 391
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
