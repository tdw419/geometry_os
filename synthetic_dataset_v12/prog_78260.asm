; DESCRIPTION: Renders a blue line between points (200, 176) and (127, 216).
; PLAN: r0=200(x1), r1=176(y1), r2=127(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 176
LDI r2, 127
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
