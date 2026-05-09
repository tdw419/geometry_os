; DESCRIPTION: Places a purple line segment connecting (55, 104) to (363, 200).
; PLAN: r0=55(x1), r1=104(y1), r2=363(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 104
LDI r2, 363
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
