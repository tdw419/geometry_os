; DESCRIPTION: Draws a orange line from (184, 158) to (214, 35).
; PLAN: r0=184(x1), r1=158(y1), r2=214(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 158
LDI r2, 214
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
