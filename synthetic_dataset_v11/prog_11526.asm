; DESCRIPTION: Places a purple line segment connecting (250, 20) to (139, 204).
; PLAN: r0=250(x1), r1=20(y1), r2=139(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 20
LDI r2, 139
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
