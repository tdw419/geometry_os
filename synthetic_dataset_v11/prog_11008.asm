; DESCRIPTION: Draws a orange line from (227, 13) to (114, 147).
; PLAN: r0=227(x1), r1=13(y1), r2=114(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 13
LDI r2, 114
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
