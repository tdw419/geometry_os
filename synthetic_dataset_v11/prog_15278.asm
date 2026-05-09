; DESCRIPTION: Places a orange line segment connecting (83, 211) to (125, 246).
; PLAN: r0=83(x1), r1=211(y1), r2=125(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 211
LDI r2, 125
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
