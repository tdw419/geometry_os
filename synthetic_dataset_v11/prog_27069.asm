; DESCRIPTION: Renders a blue line between points (106, 170) and (109, 159).
; PLAN: r0=106(x1), r1=170(y1), r2=109(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 170
LDI r2, 109
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
