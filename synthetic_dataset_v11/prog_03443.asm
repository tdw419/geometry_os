; DESCRIPTION: Renders a orange line between points (52, 216) and (71, 99).
; PLAN: r0=52(x1), r1=216(y1), r2=71(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 216
LDI r2, 71
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
