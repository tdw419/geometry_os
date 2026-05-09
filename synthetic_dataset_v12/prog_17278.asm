; DESCRIPTION: Places a orange line segment connecting (110, 9) to (233, 220).
; PLAN: r0=110(x1), r1=9(y1), r2=233(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 9
LDI r2, 233
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
