; DESCRIPTION: Draws a yellow line from (214, 41) to (184, 100).
; PLAN: r0=214(x1), r1=41(y1), r2=184(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 41
LDI r2, 184
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
