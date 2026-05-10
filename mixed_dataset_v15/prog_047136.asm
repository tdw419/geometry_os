; DESCRIPTION: Draws a orange line from (430, 181) to (403, 80).
; PLAN: r0=430(x1), r1=181(y1), r2=403(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 181
LDI r2, 403
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
