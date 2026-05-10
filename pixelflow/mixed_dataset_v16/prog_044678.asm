; DESCRIPTION: Renders a orange line between points (422, 233) and (149, 216).
; PLAN: r0=422(x1), r1=233(y1), r2=149(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 233
LDI r2, 149
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
