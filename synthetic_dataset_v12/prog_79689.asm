; DESCRIPTION: Places a orange line segment connecting (142, 148) to (119, 65).
; PLAN: r0=142(x1), r1=148(y1), r2=119(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 148
LDI r2, 119
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
