; DESCRIPTION: Renders a orange line between points (366, 9) and (316, 19).
; PLAN: r0=366(x1), r1=9(y1), r2=316(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 9
LDI r2, 316
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
