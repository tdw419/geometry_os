; DESCRIPTION: Draws a orange line from (50, 156) to (408, 41).
; PLAN: r0=50(x1), r1=156(y1), r2=408(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 156
LDI r2, 408
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
