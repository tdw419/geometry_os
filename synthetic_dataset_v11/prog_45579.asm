; DESCRIPTION: Draws a orange line from (34, 45) to (234, 217).
; PLAN: r0=34(x1), r1=45(y1), r2=234(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 45
LDI r2, 234
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
