; DESCRIPTION: Places a orange line segment connecting (407, 203) to (238, 127).
; PLAN: r0=407(x1), r1=203(y1), r2=238(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 203
LDI r2, 238
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
