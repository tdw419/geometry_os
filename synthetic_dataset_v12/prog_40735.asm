; DESCRIPTION: Places a orange line segment connecting (381, 53) to (203, 210).
; PLAN: r0=381(x1), r1=53(y1), r2=203(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 53
LDI r2, 203
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
