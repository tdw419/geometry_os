; DESCRIPTION: Places a blue line segment connecting (33, 119) to (221, 133).
; PLAN: r0=33(x1), r1=119(y1), r2=221(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 119
LDI r2, 221
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
