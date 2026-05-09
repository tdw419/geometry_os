; DESCRIPTION: Places a orange line segment connecting (232, 8) to (89, 146).
; PLAN: r0=232(x1), r1=8(y1), r2=89(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 8
LDI r2, 89
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
