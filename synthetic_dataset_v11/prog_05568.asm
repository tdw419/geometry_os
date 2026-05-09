; DESCRIPTION: Places a black line segment connecting (170, 145) to (254, 110).
; PLAN: r0=170(x1), r1=145(y1), r2=254(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 145
LDI r2, 254
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
