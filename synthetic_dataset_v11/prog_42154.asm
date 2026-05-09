; DESCRIPTION: Draws a orange line from (174, 214) to (41, 247).
; PLAN: r0=174(x1), r1=214(y1), r2=41(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 214
LDI r2, 41
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
