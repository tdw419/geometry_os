; DESCRIPTION: Renders a orange line between points (130, 249) and (99, 216).
; PLAN: r0=130(x1), r1=249(y1), r2=99(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 249
LDI r2, 99
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
