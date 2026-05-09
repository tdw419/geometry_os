; DESCRIPTION: Places a orange line segment connecting (35, 220) to (83, 34).
; PLAN: r0=35(x1), r1=220(y1), r2=83(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 220
LDI r2, 83
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
