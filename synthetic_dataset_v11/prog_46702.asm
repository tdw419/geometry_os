; DESCRIPTION: Renders a blue line between points (148, 111) and (237, 88).
; PLAN: r0=148(x1), r1=111(y1), r2=237(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 111
LDI r2, 237
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
