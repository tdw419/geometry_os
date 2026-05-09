; DESCRIPTION: Places a orange line segment connecting (423, 120) to (110, 137).
; PLAN: r0=423(x1), r1=120(y1), r2=110(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 120
LDI r2, 110
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
