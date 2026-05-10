; DESCRIPTION: Places a black line segment connecting (366, 110) to (390, 218).
; PLAN: r0=366(x1), r1=110(y1), r2=390(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 110
LDI r2, 390
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
