; DESCRIPTION: Renders a yellow line between points (175, 119) and (501, 140).
; PLAN: r0=175(x1), r1=119(y1), r2=501(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 119
LDI r2, 501
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
