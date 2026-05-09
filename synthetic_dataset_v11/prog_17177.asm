; DESCRIPTION: Places a orange line segment connecting (49, 200) to (203, 191).
; PLAN: r0=49(x1), r1=200(y1), r2=203(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 200
LDI r2, 203
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
