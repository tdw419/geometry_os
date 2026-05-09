; DESCRIPTION: Draws a orange line from (105, 121) to (314, 53).
; PLAN: r0=105(x1), r1=121(y1), r2=314(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 121
LDI r2, 314
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
