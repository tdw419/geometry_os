; DESCRIPTION: Places a orange line segment connecting (254, 189) to (83, 229).
; PLAN: r0=254(x1), r1=189(y1), r2=83(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 189
LDI r2, 83
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
