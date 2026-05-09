; DESCRIPTION: Places a purple line segment connecting (99, 169) to (83, 250).
; PLAN: r0=99(x1), r1=169(y1), r2=83(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 169
LDI r2, 83
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
