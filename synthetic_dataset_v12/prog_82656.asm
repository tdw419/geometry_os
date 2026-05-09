; DESCRIPTION: Draws a orange line from (483, 36) to (312, 129).
; PLAN: r0=483(x1), r1=36(y1), r2=312(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 36
LDI r2, 312
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
