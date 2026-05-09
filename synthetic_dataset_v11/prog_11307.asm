; DESCRIPTION: Draws a orange line from (229, 15) to (227, 11).
; PLAN: r0=229(x1), r1=15(y1), r2=227(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 15
LDI r2, 227
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
