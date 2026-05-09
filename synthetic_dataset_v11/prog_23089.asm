; DESCRIPTION: Places a orange line segment connecting (112, 156) to (210, 241).
; PLAN: r0=112(x1), r1=156(y1), r2=210(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 156
LDI r2, 210
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
