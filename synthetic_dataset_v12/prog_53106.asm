; DESCRIPTION: Places a orange line segment connecting (275, 120) to (462, 72).
; PLAN: r0=275(x1), r1=120(y1), r2=462(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 120
LDI r2, 462
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
