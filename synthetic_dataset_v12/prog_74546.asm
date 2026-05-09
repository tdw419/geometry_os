; DESCRIPTION: Renders a orange line between points (326, 66) and (389, 148).
; PLAN: r0=326(x1), r1=66(y1), r2=389(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 66
LDI r2, 389
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
