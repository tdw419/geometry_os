; DESCRIPTION: Draws a orange line from (232, 126) to (497, 200).
; PLAN: r0=232(x1), r1=126(y1), r2=497(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 126
LDI r2, 497
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
