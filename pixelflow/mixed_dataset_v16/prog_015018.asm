; DESCRIPTION: Renders a black line between points (287, 57) and (136, 216).
; PLAN: r0=287(x1), r1=57(y1), r2=136(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 57
LDI r2, 136
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
