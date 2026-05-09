; DESCRIPTION: Renders a blue line between points (300, 198) and (374, 140).
; PLAN: r0=300(x1), r1=198(y1), r2=374(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 198
LDI r2, 374
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
