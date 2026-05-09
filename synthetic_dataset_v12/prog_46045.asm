; DESCRIPTION: Draws a orange line from (14, 203) to (36, 244).
; PLAN: r0=14(x1), r1=203(y1), r2=36(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 203
LDI r2, 36
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
