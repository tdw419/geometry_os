; DESCRIPTION: Renders a purple line between points (311, 16) and (403, 155).
; PLAN: r0=311(x1), r1=16(y1), r2=403(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 16
LDI r2, 403
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
