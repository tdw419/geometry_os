; DESCRIPTION: Places a orange line segment connecting (52, 91) to (38, 140).
; PLAN: r0=52(x1), r1=91(y1), r2=38(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 91
LDI r2, 38
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
