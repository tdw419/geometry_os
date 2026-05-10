; DESCRIPTION: Places a orange line segment connecting (186, 203) to (33, 41).
; PLAN: r0=186(x1), r1=203(y1), r2=33(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 203
LDI r2, 33
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
