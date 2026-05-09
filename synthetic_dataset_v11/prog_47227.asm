; DESCRIPTION: Draws a orange line from (236, 26) to (69, 101).
; PLAN: r0=236(x1), r1=26(y1), r2=69(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 26
LDI r2, 69
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
