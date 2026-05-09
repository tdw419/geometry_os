; DESCRIPTION: Places a orange line segment connecting (203, 101) to (24, 178).
; PLAN: r0=203(x1), r1=101(y1), r2=24(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 101
LDI r2, 24
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
