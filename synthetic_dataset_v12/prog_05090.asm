; DESCRIPTION: Draws a orange line from (26, 172) to (148, 79).
; PLAN: r0=26(x1), r1=172(y1), r2=148(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 172
LDI r2, 148
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
