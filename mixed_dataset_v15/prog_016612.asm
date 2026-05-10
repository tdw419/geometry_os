; DESCRIPTION: Places a orange line segment connecting (125, 190) to (44, 65).
; PLAN: r0=125(x1), r1=190(y1), r2=44(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 190
LDI r2, 44
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
