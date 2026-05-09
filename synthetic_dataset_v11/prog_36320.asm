; DESCRIPTION: Places a orange line segment connecting (158, 8) to (114, 138).
; PLAN: r0=158(x1), r1=8(y1), r2=114(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 8
LDI r2, 114
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
