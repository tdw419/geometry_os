; DESCRIPTION: Places a orange line segment connecting (432, 218) to (440, 141).
; PLAN: r0=432(x1), r1=218(y1), r2=440(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 218
LDI r2, 440
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
