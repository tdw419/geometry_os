; DESCRIPTION: Draws a orange line from (414, 8) to (93, 119).
; PLAN: r0=414(x1), r1=8(y1), r2=93(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 8
LDI r2, 93
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
