; DESCRIPTION: Draws a orange line from (137, 150) to (49, 78).
; PLAN: r0=137(x1), r1=150(y1), r2=49(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 150
LDI r2, 49
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
