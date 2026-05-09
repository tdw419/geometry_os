; DESCRIPTION: Draws a orange line from (80, 101) to (199, 67).
; PLAN: r0=80(x1), r1=101(y1), r2=199(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 101
LDI r2, 199
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
