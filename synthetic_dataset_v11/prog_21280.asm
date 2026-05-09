; DESCRIPTION: Places a orange line segment connecting (7, 80) to (10, 254).
; PLAN: r0=7(x1), r1=80(y1), r2=10(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 80
LDI r2, 10
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
