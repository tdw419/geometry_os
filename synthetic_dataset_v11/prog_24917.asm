; DESCRIPTION: Renders a black line between points (136, 125) and (0, 191).
; PLAN: r0=136(x1), r1=125(y1), r2=0(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 125
LDI r2, 0
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
