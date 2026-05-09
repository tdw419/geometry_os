; DESCRIPTION: Renders a orange line between points (204, 13) and (234, 93).
; PLAN: r0=204(x1), r1=13(y1), r2=234(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 13
LDI r2, 234
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
