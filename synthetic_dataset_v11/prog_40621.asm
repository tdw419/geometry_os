; DESCRIPTION: Places a orange line segment connecting (203, 34) to (212, 142).
; PLAN: r0=203(x1), r1=34(y1), r2=212(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 34
LDI r2, 212
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
