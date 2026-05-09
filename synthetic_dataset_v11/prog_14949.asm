; DESCRIPTION: Renders a yellow line between points (7, 235) and (191, 155).
; PLAN: r0=7(x1), r1=235(y1), r2=191(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 235
LDI r2, 191
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
