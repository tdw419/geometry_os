; DESCRIPTION: Draws a purple line from (30, 89) to (237, 41).
; PLAN: r0=30(x1), r1=89(y1), r2=237(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 89
LDI r2, 237
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
