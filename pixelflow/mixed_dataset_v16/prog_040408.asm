; DESCRIPTION: Places a orange line segment connecting (406, 69) to (201, 136).
; PLAN: r0=406(x1), r1=69(y1), r2=201(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 69
LDI r2, 201
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
