; DESCRIPTION: Draws a orange line from (25, 116) to (163, 148).
; PLAN: r0=25(x1), r1=116(y1), r2=163(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 116
LDI r2, 163
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
