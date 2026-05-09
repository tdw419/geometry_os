; DESCRIPTION: Renders a blue line between points (303, 237) and (148, 155).
; PLAN: r0=303(x1), r1=237(y1), r2=148(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 237
LDI r2, 148
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
