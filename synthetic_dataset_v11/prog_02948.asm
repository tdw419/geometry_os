; DESCRIPTION: Renders a orange line between points (99, 134) and (94, 142).
; PLAN: r0=99(x1), r1=134(y1), r2=94(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 134
LDI r2, 94
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
