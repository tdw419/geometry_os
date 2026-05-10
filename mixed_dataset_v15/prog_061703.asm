; DESCRIPTION: Places a orange line segment connecting (133, 198) to (355, 160).
; PLAN: r0=133(x1), r1=198(y1), r2=355(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 198
LDI r2, 355
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
