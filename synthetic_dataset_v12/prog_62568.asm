; DESCRIPTION: Places a purple line segment connecting (328, 110) to (207, 105).
; PLAN: r0=328(x1), r1=110(y1), r2=207(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 110
LDI r2, 207
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
