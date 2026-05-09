; DESCRIPTION: Places a orange line segment connecting (203, 15) to (98, 140).
; PLAN: r0=203(x1), r1=15(y1), r2=98(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 15
LDI r2, 98
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
