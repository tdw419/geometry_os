; DESCRIPTION: Draws a orange line from (41, 0) to (490, 93).
; PLAN: r0=41(x1), r1=0(y1), r2=490(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 0
LDI r2, 490
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
