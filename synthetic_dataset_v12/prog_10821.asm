; DESCRIPTION: Renders a green line between points (390, 188) and (80, 129).
; PLAN: r0=390(x1), r1=188(y1), r2=80(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 188
LDI r2, 80
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
