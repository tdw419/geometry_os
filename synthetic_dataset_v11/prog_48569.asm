; DESCRIPTION: Renders a orange line between points (133, 199) and (168, 161).
; PLAN: r0=133(x1), r1=199(y1), r2=168(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 199
LDI r2, 168
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
