; DESCRIPTION: Renders a orange line between points (150, 247) and (396, 10).
; PLAN: r0=150(x1), r1=247(y1), r2=396(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 247
LDI r2, 396
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
