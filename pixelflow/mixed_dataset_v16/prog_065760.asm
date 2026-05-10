; DESCRIPTION: Places a blue line segment connecting (448, 110) to (241, 100).
; PLAN: r0=448(x1), r1=110(y1), r2=241(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 110
LDI r2, 241
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
