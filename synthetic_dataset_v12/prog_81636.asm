; DESCRIPTION: Renders a yellow line between points (370, 10) and (141, 130).
; PLAN: r0=370(x1), r1=10(y1), r2=141(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 10
LDI r2, 141
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
