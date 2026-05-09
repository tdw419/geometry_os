; DESCRIPTION: Draws a orange line from (75, 232) to (232, 98).
; PLAN: r0=75(x1), r1=232(y1), r2=232(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 232
LDI r2, 232
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
