; DESCRIPTION: Draws a orange line from (156, 234) to (34, 104).
; PLAN: r0=156(x1), r1=234(y1), r2=34(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 234
LDI r2, 34
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
