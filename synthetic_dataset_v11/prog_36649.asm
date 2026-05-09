; DESCRIPTION: Draws a orange line from (10, 199) to (220, 41).
; PLAN: r0=10(x1), r1=199(y1), r2=220(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 199
LDI r2, 220
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
