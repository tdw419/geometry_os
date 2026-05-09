; DESCRIPTION: Places a blue line segment connecting (160, 137) to (222, 119).
; PLAN: r0=160(x1), r1=137(y1), r2=222(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 137
LDI r2, 222
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
