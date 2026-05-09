; DESCRIPTION: Draws a orange line from (501, 26) to (457, 108).
; PLAN: r0=501(x1), r1=26(y1), r2=457(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 26
LDI r2, 457
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
