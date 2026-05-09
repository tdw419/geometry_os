; DESCRIPTION: Renders a blue line between points (311, 97) and (400, 179).
; PLAN: r0=311(x1), r1=97(y1), r2=400(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 97
LDI r2, 400
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
