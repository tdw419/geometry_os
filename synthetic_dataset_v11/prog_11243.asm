; DESCRIPTION: Renders a orange line between points (118, 150) and (204, 153).
; PLAN: r0=118(x1), r1=150(y1), r2=204(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 150
LDI r2, 204
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
