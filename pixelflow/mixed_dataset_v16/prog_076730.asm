; DESCRIPTION: Renders a black line between points (424, 184) and (478, 237).
; PLAN: r0=424(x1), r1=184(y1), r2=478(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 184
LDI r2, 478
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
