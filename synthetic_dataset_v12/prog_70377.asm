; DESCRIPTION: Draws a orange line from (169, 137) to (447, 244).
; PLAN: r0=169(x1), r1=137(y1), r2=447(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 137
LDI r2, 447
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
