; DESCRIPTION: Places a orange line segment connecting (118, 34) to (140, 25).
; PLAN: r0=118(x1), r1=34(y1), r2=140(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 34
LDI r2, 140
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
