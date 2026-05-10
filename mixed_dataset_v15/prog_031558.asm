; DESCRIPTION: Renders a magenta line between points (155, 96) and (494, 115).
; PLAN: r0=155(x1), r1=96(y1), r2=494(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 96
LDI r2, 494
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
