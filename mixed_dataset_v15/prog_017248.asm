; DESCRIPTION: Renders a orange line between points (54, 24) and (302, 243).
; PLAN: r0=54(x1), r1=24(y1), r2=302(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 24
LDI r2, 302
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
