; DESCRIPTION: Places a orange line segment connecting (7, 90) to (131, 76).
; PLAN: r0=7(x1), r1=90(y1), r2=131(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 90
LDI r2, 131
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
