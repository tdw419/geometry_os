; DESCRIPTION: Renders a orange line between points (119, 183) and (206, 168).
; PLAN: r0=119(x1), r1=183(y1), r2=206(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 183
LDI r2, 206
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
