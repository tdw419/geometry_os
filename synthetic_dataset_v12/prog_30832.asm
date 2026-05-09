; DESCRIPTION: Places a orange line segment connecting (97, 22) to (106, 95).
; PLAN: r0=97(x1), r1=22(y1), r2=106(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 22
LDI r2, 106
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
