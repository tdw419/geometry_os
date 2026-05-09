; DESCRIPTION: Renders a blue line between points (235, 11) and (501, 201).
; PLAN: r0=235(x1), r1=11(y1), r2=501(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 11
LDI r2, 501
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
