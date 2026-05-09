; DESCRIPTION: Draws a yellow line from (292, 210) to (41, 110).
; PLAN: r0=292(x1), r1=210(y1), r2=41(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 210
LDI r2, 41
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
