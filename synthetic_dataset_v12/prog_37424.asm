; DESCRIPTION: Places a orange line segment connecting (432, 160) to (103, 232).
; PLAN: r0=432(x1), r1=160(y1), r2=103(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 160
LDI r2, 103
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
