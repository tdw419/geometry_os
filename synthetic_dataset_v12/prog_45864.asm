; DESCRIPTION: Renders a purple line between points (188, 63) and (136, 134).
; PLAN: r0=188(x1), r1=63(y1), r2=136(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 63
LDI r2, 136
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
