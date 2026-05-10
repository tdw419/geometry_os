; DESCRIPTION: Draws a purple line from (427, 41) to (114, 86).
; PLAN: r0=427(x1), r1=41(y1), r2=114(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 41
LDI r2, 114
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
