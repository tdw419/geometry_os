; DESCRIPTION: Draws a orange line from (312, 61) to (148, 50).
; PLAN: r0=312(x1), r1=61(y1), r2=148(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 61
LDI r2, 148
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
