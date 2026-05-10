; DESCRIPTION: Renders a orange line between points (432, 203) and (89, 52).
; PLAN: r0=432(x1), r1=203(y1), r2=89(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 203
LDI r2, 89
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
