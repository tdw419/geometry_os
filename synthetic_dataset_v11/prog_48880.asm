; DESCRIPTION: Places a purple line segment connecting (250, 255) to (153, 147).
; PLAN: r0=250(x1), r1=255(y1), r2=153(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 255
LDI r2, 153
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
