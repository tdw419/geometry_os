; DESCRIPTION: Places a orange line segment connecting (28, 251) to (462, 110).
; PLAN: r0=28(x1), r1=251(y1), r2=462(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 251
LDI r2, 462
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
