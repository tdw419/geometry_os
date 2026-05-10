; DESCRIPTION: Draws a orange line from (427, 97) to (403, 80).
; PLAN: r0=427(x1), r1=97(y1), r2=403(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 97
LDI r2, 403
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
