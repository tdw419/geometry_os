; DESCRIPTION: Draws a orange line from (497, 207) to (184, 141).
; PLAN: r0=497(x1), r1=207(y1), r2=184(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 207
LDI r2, 184
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
