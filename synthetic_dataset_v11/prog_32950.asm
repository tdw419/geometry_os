; DESCRIPTION: Renders a blue line between points (237, 204) and (136, 230).
; PLAN: r0=237(x1), r1=204(y1), r2=136(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 204
LDI r2, 136
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
