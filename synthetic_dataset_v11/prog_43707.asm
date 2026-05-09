; DESCRIPTION: Draws a orange line from (69, 86) to (226, 181).
; PLAN: r0=69(x1), r1=86(y1), r2=226(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 86
LDI r2, 226
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
