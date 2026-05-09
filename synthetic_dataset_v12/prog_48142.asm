; DESCRIPTION: Places a orange line segment connecting (188, 46) to (266, 87).
; PLAN: r0=188(x1), r1=46(y1), r2=266(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 46
LDI r2, 266
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
