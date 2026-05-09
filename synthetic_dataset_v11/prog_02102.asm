; DESCRIPTION: Draws a orange line from (110, 76) to (238, 112).
; PLAN: r0=110(x1), r1=76(y1), r2=238(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 76
LDI r2, 238
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
