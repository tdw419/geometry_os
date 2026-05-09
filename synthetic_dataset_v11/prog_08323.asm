; DESCRIPTION: Places a purple line segment connecting (110, 58) to (251, 59).
; PLAN: r0=110(x1), r1=58(y1), r2=251(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 58
LDI r2, 251
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
