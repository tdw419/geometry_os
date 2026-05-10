; DESCRIPTION: Draws a purple line from (299, 41) to (432, 104).
; PLAN: r0=299(x1), r1=41(y1), r2=432(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 41
LDI r2, 432
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
