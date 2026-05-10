; DESCRIPTION: Draws a orange line from (99, 92) to (159, 19).
; PLAN: r0=99(x1), r1=92(y1), r2=159(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 92
LDI r2, 159
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
