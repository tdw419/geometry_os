; DESCRIPTION: Draws a orange line from (423, 101) to (285, 174).
; PLAN: r0=423(x1), r1=101(y1), r2=285(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 101
LDI r2, 285
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
