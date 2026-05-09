; DESCRIPTION: Places a purple line segment connecting (25, 204) to (448, 153).
; PLAN: r0=25(x1), r1=204(y1), r2=448(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 204
LDI r2, 448
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
