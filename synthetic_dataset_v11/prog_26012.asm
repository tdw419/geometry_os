; DESCRIPTION: Draws a purple line from (184, 238) to (41, 234).
; PLAN: r0=184(x1), r1=238(y1), r2=41(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 238
LDI r2, 41
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
