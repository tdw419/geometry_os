; DESCRIPTION: Draws a orange line from (497, 106) to (424, 32).
; PLAN: r0=497(x1), r1=106(y1), r2=424(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 106
LDI r2, 424
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
