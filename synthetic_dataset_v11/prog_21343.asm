; DESCRIPTION: Places a orange line segment connecting (63, 118) to (122, 187).
; PLAN: r0=63(x1), r1=118(y1), r2=122(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 118
LDI r2, 122
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
