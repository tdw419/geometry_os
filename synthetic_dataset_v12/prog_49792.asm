; DESCRIPTION: Renders a black line between points (396, 106) and (148, 1).
; PLAN: r0=396(x1), r1=106(y1), r2=148(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 106
LDI r2, 148
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
