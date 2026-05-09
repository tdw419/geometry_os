; DESCRIPTION: Draws a orange line from (78, 122) to (376, 15).
; PLAN: r0=78(x1), r1=122(y1), r2=376(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 122
LDI r2, 376
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
