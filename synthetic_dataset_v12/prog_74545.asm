; DESCRIPTION: Draws a orange line from (312, 114) to (246, 108).
; PLAN: r0=312(x1), r1=114(y1), r2=246(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 114
LDI r2, 246
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
