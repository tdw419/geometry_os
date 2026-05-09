; DESCRIPTION: Places a orange line segment connecting (118, 44) to (46, 118).
; PLAN: r0=118(x1), r1=44(y1), r2=46(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 44
LDI r2, 46
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
