; DESCRIPTION: Places a orange line segment connecting (8, 50) to (477, 78).
; PLAN: r0=8(x1), r1=50(y1), r2=477(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 50
LDI r2, 477
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
