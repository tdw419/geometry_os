; DESCRIPTION: Renders a orange line between points (316, 80) and (443, 9).
; PLAN: r0=316(x1), r1=80(y1), r2=443(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 80
LDI r2, 443
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
