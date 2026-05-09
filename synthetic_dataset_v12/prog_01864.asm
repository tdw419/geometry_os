; DESCRIPTION: Renders a blue line between points (216, 24) and (98, 251).
; PLAN: r0=216(x1), r1=24(y1), r2=98(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 24
LDI r2, 98
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
