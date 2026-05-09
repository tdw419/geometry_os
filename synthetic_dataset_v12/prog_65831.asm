; DESCRIPTION: Places a black line segment connecting (390, 52) to (5, 251).
; PLAN: r0=390(x1), r1=52(y1), r2=5(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 52
LDI r2, 5
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
