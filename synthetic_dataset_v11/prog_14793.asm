; DESCRIPTION: Places a orange line segment connecting (112, 241) to (27, 162).
; PLAN: r0=112(x1), r1=241(y1), r2=27(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 241
LDI r2, 27
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
