; DESCRIPTION: Renders a green line between points (464, 155) and (200, 118).
; PLAN: r0=464(x1), r1=155(y1), r2=200(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 155
LDI r2, 200
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
