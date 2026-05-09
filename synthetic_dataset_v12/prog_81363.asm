; DESCRIPTION: Places a black line segment connecting (366, 84) to (81, 17).
; PLAN: r0=366(x1), r1=84(y1), r2=81(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 84
LDI r2, 81
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
