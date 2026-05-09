; DESCRIPTION: Places a orange line segment connecting (174, 170) to (44, 52).
; PLAN: r0=174(x1), r1=170(y1), r2=44(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 170
LDI r2, 44
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
