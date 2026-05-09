; DESCRIPTION: Places a purple line segment connecting (225, 104) to (78, 168).
; PLAN: r0=225(x1), r1=104(y1), r2=78(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 104
LDI r2, 78
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
