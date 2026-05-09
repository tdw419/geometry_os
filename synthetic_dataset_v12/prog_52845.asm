; DESCRIPTION: Places a orange line segment connecting (254, 178) to (147, 112).
; PLAN: r0=254(x1), r1=178(y1), r2=147(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 178
LDI r2, 147
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
