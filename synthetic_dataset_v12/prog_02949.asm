; DESCRIPTION: Renders a black line between points (355, 153) and (185, 237).
; PLAN: r0=355(x1), r1=153(y1), r2=185(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 153
LDI r2, 185
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
