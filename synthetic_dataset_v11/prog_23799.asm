; DESCRIPTION: Draws a orange line from (12, 36) to (246, 41).
; PLAN: r0=12(x1), r1=36(y1), r2=246(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 36
LDI r2, 246
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
