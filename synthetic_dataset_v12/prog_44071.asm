; DESCRIPTION: Renders a orange line between points (91, 9) and (489, 97).
; PLAN: r0=91(x1), r1=9(y1), r2=489(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 9
LDI r2, 489
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
