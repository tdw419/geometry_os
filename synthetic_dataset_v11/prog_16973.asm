; DESCRIPTION: Places a orange line segment connecting (159, 156) to (254, 152).
; PLAN: r0=159(x1), r1=156(y1), r2=254(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 156
LDI r2, 254
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
