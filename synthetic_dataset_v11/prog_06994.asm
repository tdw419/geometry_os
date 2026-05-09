; DESCRIPTION: Places a orange line segment connecting (72, 200) to (148, 184).
; PLAN: r0=72(x1), r1=200(y1), r2=148(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 200
LDI r2, 148
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
