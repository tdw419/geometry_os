; DESCRIPTION: Renders a blue line between points (222, 86) and (353, 118).
; PLAN: r0=222(x1), r1=86(y1), r2=353(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 86
LDI r2, 353
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
