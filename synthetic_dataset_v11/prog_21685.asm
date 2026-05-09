; DESCRIPTION: Draws a orange line from (212, 164) to (14, 121).
; PLAN: r0=212(x1), r1=164(y1), r2=14(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 164
LDI r2, 14
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
