; DESCRIPTION: Renders a orange line between points (302, 52) and (216, 38).
; PLAN: r0=302(x1), r1=52(y1), r2=216(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 52
LDI r2, 216
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
