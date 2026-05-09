; DESCRIPTION: Places a orange line segment connecting (356, 203) to (88, 12).
; PLAN: r0=356(x1), r1=203(y1), r2=88(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 203
LDI r2, 88
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
