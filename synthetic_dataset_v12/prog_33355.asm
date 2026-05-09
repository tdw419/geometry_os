; DESCRIPTION: Places a orange line segment connecting (508, 48) to (458, 183).
; PLAN: r0=508(x1), r1=48(y1), r2=458(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 48
LDI r2, 458
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
