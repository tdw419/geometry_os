; DESCRIPTION: Draws a orange line from (118, 43) to (217, 125).
; PLAN: r0=118(x1), r1=43(y1), r2=217(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 43
LDI r2, 217
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
