; DESCRIPTION: Draws a orange line from (121, 26) to (184, 234).
; PLAN: r0=121(x1), r1=26(y1), r2=184(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 26
LDI r2, 184
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
