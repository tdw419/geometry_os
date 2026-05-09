; DESCRIPTION: Draws a orange line from (45, 59) to (179, 122).
; PLAN: r0=45(x1), r1=59(y1), r2=179(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 59
LDI r2, 179
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
