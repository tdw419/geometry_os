; DESCRIPTION: Renders a blue line between points (213, 235) and (129, 112).
; PLAN: r0=213(x1), r1=235(y1), r2=129(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 235
LDI r2, 129
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
