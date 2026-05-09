; DESCRIPTION: Renders a black line between points (302, 240) and (58, 130).
; PLAN: r0=302(x1), r1=240(y1), r2=58(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 240
LDI r2, 58
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
