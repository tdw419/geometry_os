; DESCRIPTION: Places a orange line segment connecting (380, 6) to (486, 0).
; PLAN: r0=380(x1), r1=6(y1), r2=486(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 6
LDI r2, 486
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
