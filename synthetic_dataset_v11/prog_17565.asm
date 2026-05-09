; DESCRIPTION: Draws a orange line from (100, 183) to (83, 104).
; PLAN: r0=100(x1), r1=183(y1), r2=83(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 183
LDI r2, 83
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
