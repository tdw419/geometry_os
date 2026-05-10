; DESCRIPTION: Draws a orange line from (233, 62) to (109, 105).
; PLAN: r0=233(x1), r1=62(y1), r2=109(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 62
LDI r2, 109
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
