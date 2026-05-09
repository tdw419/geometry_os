; DESCRIPTION: Places a orange line segment connecting (120, 40) to (190, 44).
; PLAN: r0=120(x1), r1=40(y1), r2=190(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 40
LDI r2, 190
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
