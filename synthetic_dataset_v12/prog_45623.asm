; DESCRIPTION: Renders a orange line between points (283, 7) and (143, 123).
; PLAN: r0=283(x1), r1=7(y1), r2=143(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 7
LDI r2, 143
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
