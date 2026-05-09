; DESCRIPTION: Places a orange line segment connecting (169, 81) to (458, 85).
; PLAN: r0=169(x1), r1=81(y1), r2=458(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 81
LDI r2, 458
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
