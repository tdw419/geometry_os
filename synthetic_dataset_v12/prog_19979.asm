; DESCRIPTION: Draws a orange line from (137, 125) to (140, 53).
; PLAN: r0=137(x1), r1=125(y1), r2=140(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 125
LDI r2, 140
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
