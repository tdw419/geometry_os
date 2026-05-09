; DESCRIPTION: Renders a blue line between points (311, 197) and (417, 155).
; PLAN: r0=311(x1), r1=197(y1), r2=417(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 197
LDI r2, 417
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
