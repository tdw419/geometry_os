; DESCRIPTION: Places a orange line segment connecting (207, 10) to (179, 77).
; PLAN: r0=207(x1), r1=10(y1), r2=179(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 10
LDI r2, 179
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
