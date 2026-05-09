; DESCRIPTION: Renders a black line between points (72, 68) and (478, 96).
; PLAN: r0=72(x1), r1=68(y1), r2=478(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 68
LDI r2, 478
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
