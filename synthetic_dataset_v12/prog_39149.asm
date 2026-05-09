; DESCRIPTION: Draws a orange line from (169, 123) to (413, 170).
; PLAN: r0=169(x1), r1=123(y1), r2=413(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 123
LDI r2, 413
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
