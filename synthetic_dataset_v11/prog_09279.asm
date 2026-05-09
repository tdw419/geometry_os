; DESCRIPTION: Draws a purple line from (17, 132) to (119, 41).
; PLAN: r0=17(x1), r1=132(y1), r2=119(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 132
LDI r2, 119
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
