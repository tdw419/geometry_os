; DESCRIPTION: Draws a orange line from (227, 137) to (154, 218).
; PLAN: r0=227(x1), r1=137(y1), r2=154(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 137
LDI r2, 154
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
