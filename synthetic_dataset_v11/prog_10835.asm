; DESCRIPTION: Renders a orange line between points (133, 232) and (150, 14).
; PLAN: r0=133(x1), r1=232(y1), r2=150(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 232
LDI r2, 150
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
