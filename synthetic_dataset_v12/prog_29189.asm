; DESCRIPTION: Renders a green line between points (148, 201) and (155, 178).
; PLAN: r0=148(x1), r1=201(y1), r2=155(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 201
LDI r2, 155
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
