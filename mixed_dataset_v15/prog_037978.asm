; DESCRIPTION: Draws a orange line from (429, 217) to (375, 74).
; PLAN: r0=429(x1), r1=217(y1), r2=375(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 217
LDI r2, 375
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
