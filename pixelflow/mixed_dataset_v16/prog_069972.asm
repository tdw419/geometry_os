; DESCRIPTION: Renders a orange line between points (78, 44) and (283, 97).
; PLAN: r0=78(x1), r1=44(y1), r2=283(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 44
LDI r2, 283
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
