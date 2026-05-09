; DESCRIPTION: Renders a purple line between points (87, 157) and (129, 140).
; PLAN: r0=87(x1), r1=157(y1), r2=129(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 157
LDI r2, 129
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
