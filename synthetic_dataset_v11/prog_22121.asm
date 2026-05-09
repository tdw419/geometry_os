; DESCRIPTION: Draws a orange line from (129, 251) to (184, 182).
; PLAN: r0=129(x1), r1=251(y1), r2=184(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 251
LDI r2, 184
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
