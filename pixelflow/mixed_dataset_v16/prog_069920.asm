; DESCRIPTION: Places a orange line segment connecting (483, 241) to (112, 170).
; PLAN: r0=483(x1), r1=241(y1), r2=112(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 241
LDI r2, 112
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
