; DESCRIPTION: Draws a orange line from (33, 6) to (109, 100).
; PLAN: r0=33(x1), r1=6(y1), r2=109(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 6
LDI r2, 109
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
