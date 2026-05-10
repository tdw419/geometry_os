; DESCRIPTION: Draws a orange line from (133, 134) to (210, 155).
; PLAN: r0=133(x1), r1=134(y1), r2=210(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 134
LDI r2, 210
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
