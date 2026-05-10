; DESCRIPTION: Places a purple line segment connecting (176, 70) to (200, 170).
; PLAN: r0=176(x1), r1=70(y1), r2=200(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 70
LDI r2, 200
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
