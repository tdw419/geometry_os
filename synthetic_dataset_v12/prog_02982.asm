; DESCRIPTION: Renders a blue line between points (26, 129) and (390, 9).
; PLAN: r0=26(x1), r1=129(y1), r2=390(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 129
LDI r2, 390
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
