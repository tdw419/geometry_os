; DESCRIPTION: Draws a yellow line from (41, 50) to (79, 241).
; PLAN: r0=41(x1), r1=50(y1), r2=79(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 50
LDI r2, 79
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
