; DESCRIPTION: Places a orange line segment connecting (380, 2) to (18, 78).
; PLAN: r0=380(x1), r1=2(y1), r2=18(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 2
LDI r2, 18
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
