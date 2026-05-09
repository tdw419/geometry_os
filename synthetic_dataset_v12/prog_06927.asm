; DESCRIPTION: Places a orange line segment connecting (85, 104) to (36, 34).
; PLAN: r0=85(x1), r1=104(y1), r2=36(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 104
LDI r2, 36
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
