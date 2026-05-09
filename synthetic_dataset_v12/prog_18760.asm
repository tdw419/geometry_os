; DESCRIPTION: Renders a blue line between points (500, 147) and (240, 40).
; PLAN: r0=500(x1), r1=147(y1), r2=240(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 147
LDI r2, 240
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
