; DESCRIPTION: Places a orange line segment connecting (88, 211) to (454, 46).
; PLAN: r0=88(x1), r1=211(y1), r2=454(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 211
LDI r2, 454
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
