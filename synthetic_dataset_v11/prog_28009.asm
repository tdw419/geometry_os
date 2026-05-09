; DESCRIPTION: Places a orange line segment connecting (162, 96) to (214, 201).
; PLAN: r0=162(x1), r1=96(y1), r2=214(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 96
LDI r2, 214
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
