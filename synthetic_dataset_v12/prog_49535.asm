; DESCRIPTION: Renders a magenta line between points (155, 216) and (474, 165).
; PLAN: r0=155(x1), r1=216(y1), r2=474(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 216
LDI r2, 474
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
