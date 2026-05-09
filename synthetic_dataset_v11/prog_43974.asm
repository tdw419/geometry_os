; DESCRIPTION: Draws a orange line from (100, 203) to (111, 200).
; PLAN: r0=100(x1), r1=203(y1), r2=111(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 203
LDI r2, 111
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
