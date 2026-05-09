; DESCRIPTION: Draws a orange line from (89, 232) to (14, 125).
; PLAN: r0=89(x1), r1=232(y1), r2=14(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 232
LDI r2, 14
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
