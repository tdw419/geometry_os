; DESCRIPTION: Places a orange line segment connecting (208, 27) to (89, 170).
; PLAN: r0=208(x1), r1=27(y1), r2=89(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 27
LDI r2, 89
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
