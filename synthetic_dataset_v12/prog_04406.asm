; DESCRIPTION: Renders a white line between points (235, 34) and (163, 237).
; PLAN: r0=235(x1), r1=34(y1), r2=163(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 34
LDI r2, 163
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
