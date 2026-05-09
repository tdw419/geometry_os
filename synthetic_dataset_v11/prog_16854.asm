; DESCRIPTION: Draws a blue line from (41, 64) to (252, 135).
; PLAN: r0=41(x1), r1=64(y1), r2=252(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 64
LDI r2, 252
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
