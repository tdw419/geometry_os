; DESCRIPTION: Places a orange line segment connecting (15, 201) to (480, 110).
; PLAN: r0=15(x1), r1=201(y1), r2=480(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 201
LDI r2, 480
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
