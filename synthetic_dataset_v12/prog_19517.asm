; DESCRIPTION: Renders a orange line between points (19, 44) and (484, 149).
; PLAN: r0=19(x1), r1=44(y1), r2=484(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 44
LDI r2, 484
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
