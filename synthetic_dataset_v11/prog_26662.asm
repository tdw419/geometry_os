; DESCRIPTION: Draws a orange line from (0, 184) to (132, 165).
; PLAN: r0=0(x1), r1=184(y1), r2=132(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 184
LDI r2, 132
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
