; DESCRIPTION: Draws a orange line from (150, 162) to (452, 181).
; PLAN: r0=150(x1), r1=162(y1), r2=452(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 162
LDI r2, 452
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
