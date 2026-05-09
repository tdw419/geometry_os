; DESCRIPTION: Draws a orange line from (25, 105) to (86, 140).
; PLAN: r0=25(x1), r1=105(y1), r2=86(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 105
LDI r2, 86
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
