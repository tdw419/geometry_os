; DESCRIPTION: Renders a magenta line between points (119, 136) and (268, 250).
; PLAN: r0=119(x1), r1=136(y1), r2=268(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 136
LDI r2, 268
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
