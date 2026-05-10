; DESCRIPTION: Renders a magenta line between points (26, 81) and (155, 136).
; PLAN: r0=26(x1), r1=81(y1), r2=155(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 81
LDI r2, 155
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
