; DESCRIPTION: Draws a orange line from (500, 134) to (165, 191).
; PLAN: r0=500(x1), r1=134(y1), r2=165(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 134
LDI r2, 165
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
