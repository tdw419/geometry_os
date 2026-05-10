; DESCRIPTION: Draws a orange line from (229, 14) to (123, 58).
; PLAN: r0=229(x1), r1=14(y1), r2=123(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 14
LDI r2, 123
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
