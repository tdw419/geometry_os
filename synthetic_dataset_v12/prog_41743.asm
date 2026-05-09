; DESCRIPTION: Places a orange line segment connecting (190, 220) to (86, 10).
; PLAN: r0=190(x1), r1=220(y1), r2=86(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 220
LDI r2, 86
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
