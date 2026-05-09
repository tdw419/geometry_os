; DESCRIPTION: Places a orange line segment connecting (34, 78) to (190, 47).
; PLAN: r0=34(x1), r1=78(y1), r2=190(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 78
LDI r2, 190
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
