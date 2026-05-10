; DESCRIPTION: Places a purple line segment connecting (189, 203) to (251, 41).
; PLAN: r0=189(x1), r1=203(y1), r2=251(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 203
LDI r2, 251
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
