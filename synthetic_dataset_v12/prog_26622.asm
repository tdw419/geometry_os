; DESCRIPTION: Places a orange line segment connecting (132, 58) to (10, 122).
; PLAN: r0=132(x1), r1=58(y1), r2=10(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 58
LDI r2, 10
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
