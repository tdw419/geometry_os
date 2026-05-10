; DESCRIPTION: Places a orange line segment connecting (458, 59) to (31, 138).
; PLAN: r0=458(x1), r1=59(y1), r2=31(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 59
LDI r2, 31
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
