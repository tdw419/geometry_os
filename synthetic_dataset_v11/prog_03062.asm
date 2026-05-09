; DESCRIPTION: Renders a orange line between points (24, 241) and (3, 181).
; PLAN: r0=24(x1), r1=241(y1), r2=3(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 241
LDI r2, 3
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
