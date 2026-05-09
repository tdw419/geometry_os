; DESCRIPTION: Places a orange line segment connecting (151, 219) to (432, 137).
; PLAN: r0=151(x1), r1=219(y1), r2=432(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 219
LDI r2, 432
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
