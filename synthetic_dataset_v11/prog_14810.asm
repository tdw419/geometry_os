; DESCRIPTION: Draws a orange line from (23, 60) to (22, 58).
; PLAN: r0=23(x1), r1=60(y1), r2=22(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 60
LDI r2, 22
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
