; DESCRIPTION: Places a purple line segment connecting (99, 204) to (238, 168).
; PLAN: r0=99(x1), r1=204(y1), r2=238(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 204
LDI r2, 238
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
