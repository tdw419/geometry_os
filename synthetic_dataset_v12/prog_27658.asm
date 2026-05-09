; DESCRIPTION: Draws a orange line from (461, 41) to (165, 185).
; PLAN: r0=461(x1), r1=41(y1), r2=165(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 41
LDI r2, 165
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
