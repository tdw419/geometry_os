; DESCRIPTION: Places a blue line segment connecting (93, 11) to (80, 147).
; PLAN: r0=93(x1), r1=11(y1), r2=80(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 11
LDI r2, 80
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
