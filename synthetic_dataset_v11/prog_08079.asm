; DESCRIPTION: Places a orange line segment connecting (254, 123) to (136, 20).
; PLAN: r0=254(x1), r1=123(y1), r2=136(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 123
LDI r2, 136
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
