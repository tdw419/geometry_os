; DESCRIPTION: Places a purple line segment connecting (153, 110) to (104, 188).
; PLAN: r0=153(x1), r1=110(y1), r2=104(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 110
LDI r2, 104
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
