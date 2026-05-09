; DESCRIPTION: Draws a orange line from (51, 198) to (311, 62).
; PLAN: r0=51(x1), r1=198(y1), r2=311(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 198
LDI r2, 311
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
