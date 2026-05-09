; DESCRIPTION: Renders a blue line between points (26, 169) and (374, 127).
; PLAN: r0=26(x1), r1=169(y1), r2=374(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 169
LDI r2, 374
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
