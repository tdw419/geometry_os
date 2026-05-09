; DESCRIPTION: Draws a orange line from (97, 41) to (233, 241).
; PLAN: r0=97(x1), r1=41(y1), r2=233(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 41
LDI r2, 233
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
