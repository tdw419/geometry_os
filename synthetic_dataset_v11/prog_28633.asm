; DESCRIPTION: Places a orange line segment connecting (75, 198) to (133, 117).
; PLAN: r0=75(x1), r1=198(y1), r2=133(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 198
LDI r2, 133
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
