; DESCRIPTION: Draws a green line from (323, 193) to (67, 41).
; PLAN: r0=323(x1), r1=193(y1), r2=67(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 193
LDI r2, 67
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
