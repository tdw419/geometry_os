; DESCRIPTION: Draws a orange line from (155, 101) to (120, 82).
; PLAN: r0=155(x1), r1=101(y1), r2=120(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 101
LDI r2, 120
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
