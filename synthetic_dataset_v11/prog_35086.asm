; DESCRIPTION: Places a orange line segment connecting (78, 59) to (106, 115).
; PLAN: r0=78(x1), r1=59(y1), r2=106(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 59
LDI r2, 106
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
