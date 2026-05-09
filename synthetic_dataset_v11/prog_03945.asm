; DESCRIPTION: Renders a orange line between points (49, 9) and (234, 54).
; PLAN: r0=49(x1), r1=9(y1), r2=234(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 9
LDI r2, 234
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
