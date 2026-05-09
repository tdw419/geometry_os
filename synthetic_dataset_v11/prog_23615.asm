; DESCRIPTION: Draws a orange line from (25, 141) to (219, 153).
; PLAN: r0=25(x1), r1=141(y1), r2=219(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 141
LDI r2, 219
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
