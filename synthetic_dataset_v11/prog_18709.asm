; DESCRIPTION: Places a orange line segment connecting (190, 150) to (28, 91).
; PLAN: r0=190(x1), r1=150(y1), r2=28(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 150
LDI r2, 28
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
