; DESCRIPTION: Draws a orange line from (375, 100) to (347, 106).
; PLAN: r0=375(x1), r1=100(y1), r2=347(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 100
LDI r2, 347
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
