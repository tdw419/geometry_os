; DESCRIPTION: Renders a purple line between points (136, 235) and (265, 145).
; PLAN: r0=136(x1), r1=235(y1), r2=265(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 235
LDI r2, 265
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
