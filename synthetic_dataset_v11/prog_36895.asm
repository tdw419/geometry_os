; DESCRIPTION: Renders a blue line between points (235, 167) and (109, 86).
; PLAN: r0=235(x1), r1=167(y1), r2=109(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 167
LDI r2, 109
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
