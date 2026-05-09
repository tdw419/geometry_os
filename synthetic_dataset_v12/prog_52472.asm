; DESCRIPTION: Renders a orange line between points (396, 70) and (336, 148).
; PLAN: r0=396(x1), r1=70(y1), r2=336(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 70
LDI r2, 336
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
