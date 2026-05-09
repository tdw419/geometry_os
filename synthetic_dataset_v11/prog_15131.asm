; DESCRIPTION: Places a purple line segment connecting (149, 106) to (2, 124).
; PLAN: r0=149(x1), r1=106(y1), r2=2(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 106
LDI r2, 2
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
