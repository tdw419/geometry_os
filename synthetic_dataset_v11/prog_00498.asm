; DESCRIPTION: Places a purple line segment connecting (4, 75) to (129, 251).
; PLAN: r0=4(x1), r1=75(y1), r2=129(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 75
LDI r2, 129
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
