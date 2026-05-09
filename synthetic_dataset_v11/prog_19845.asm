; DESCRIPTION: Draws a orange line from (102, 68) to (150, 104).
; PLAN: r0=102(x1), r1=68(y1), r2=150(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 68
LDI r2, 150
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
