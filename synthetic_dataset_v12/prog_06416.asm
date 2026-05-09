; DESCRIPTION: Places a orange line segment connecting (106, 194) to (508, 233).
; PLAN: r0=106(x1), r1=194(y1), r2=508(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 194
LDI r2, 508
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
