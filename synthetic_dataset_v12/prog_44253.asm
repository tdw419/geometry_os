; DESCRIPTION: Places a orange line segment connecting (504, 55) to (471, 58).
; PLAN: r0=504(x1), r1=55(y1), r2=471(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 55
LDI r2, 471
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
