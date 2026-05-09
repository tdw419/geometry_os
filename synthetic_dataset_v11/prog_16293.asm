; DESCRIPTION: Draws a orange line from (254, 22) to (34, 189).
; PLAN: r0=254(x1), r1=22(y1), r2=34(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 22
LDI r2, 34
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
