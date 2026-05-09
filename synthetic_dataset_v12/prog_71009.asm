; DESCRIPTION: Draws a orange line from (312, 185) to (369, 52).
; PLAN: r0=312(x1), r1=185(y1), r2=369(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 185
LDI r2, 369
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
