; DESCRIPTION: Places a orange line segment connecting (418, 57) to (203, 30).
; PLAN: r0=418(x1), r1=57(y1), r2=203(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 57
LDI r2, 203
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
