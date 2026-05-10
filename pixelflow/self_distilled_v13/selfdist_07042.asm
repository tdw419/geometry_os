; DESCRIPTION: Draws a orange line from (109, 10) to (0, 140).
; PLAN: r0=109(x1), r1=10(y1), r2=0(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 10
LDI r2, 0
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
