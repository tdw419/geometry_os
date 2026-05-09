; DESCRIPTION: Draws a yellow line from (38, 89) to (41, 52).
; PLAN: r0=38(x1), r1=89(y1), r2=41(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 89
LDI r2, 41
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
