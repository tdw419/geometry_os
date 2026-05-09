; DESCRIPTION: Renders a orange line between points (408, 34) and (396, 153).
; PLAN: r0=408(x1), r1=34(y1), r2=396(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 34
LDI r2, 396
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
