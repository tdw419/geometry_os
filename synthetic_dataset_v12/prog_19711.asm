; DESCRIPTION: Renders a magenta line between points (358, 136) and (155, 203).
; PLAN: r0=358(x1), r1=136(y1), r2=155(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 136
LDI r2, 155
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
