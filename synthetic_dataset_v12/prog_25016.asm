; DESCRIPTION: Renders a magenta line between points (377, 155) and (373, 106).
; PLAN: r0=377(x1), r1=155(y1), r2=373(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 155
LDI r2, 373
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
