; DESCRIPTION: Renders a orange line between points (326, 174) and (89, 161).
; PLAN: r0=326(x1), r1=174(y1), r2=89(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 174
LDI r2, 89
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
