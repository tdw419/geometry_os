; DESCRIPTION: Renders a blue line between points (235, 45) and (369, 227).
; PLAN: r0=235(x1), r1=45(y1), r2=369(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 45
LDI r2, 369
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
