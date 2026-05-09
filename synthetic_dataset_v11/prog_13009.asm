; DESCRIPTION: Renders a blue line between points (127, 158) and (39, 191).
; PLAN: r0=127(x1), r1=158(y1), r2=39(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 158
LDI r2, 39
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
