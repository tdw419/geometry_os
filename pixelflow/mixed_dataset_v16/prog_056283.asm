; DESCRIPTION: Places a blue line segment connecting (136, 213) to (235, 118).
; PLAN: r0=136(x1), r1=213(y1), r2=235(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 213
LDI r2, 235
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
