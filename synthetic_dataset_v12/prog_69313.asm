; DESCRIPTION: Places a orange line segment connecting (190, 78) to (455, 97).
; PLAN: r0=190(x1), r1=78(y1), r2=455(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 78
LDI r2, 455
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
