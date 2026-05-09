; DESCRIPTION: Renders a blue line between points (302, 127) and (107, 201).
; PLAN: r0=302(x1), r1=127(y1), r2=107(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 127
LDI r2, 107
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
