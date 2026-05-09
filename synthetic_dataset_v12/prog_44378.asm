; DESCRIPTION: Renders a white line between points (159, 201) and (158, 188).
; PLAN: r0=159(x1), r1=201(y1), r2=158(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 201
LDI r2, 158
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
