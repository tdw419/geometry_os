; DESCRIPTION: Renders a orange line between points (35, 119) and (326, 248).
; PLAN: r0=35(x1), r1=119(y1), r2=326(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 119
LDI r2, 326
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
