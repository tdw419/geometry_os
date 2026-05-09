; DESCRIPTION: Draws a orange line from (100, 0) to (49, 79).
; PLAN: r0=100(x1), r1=0(y1), r2=49(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 0
LDI r2, 49
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
