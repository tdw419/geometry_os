; DESCRIPTION: Renders a black line between points (396, 75) and (240, 211).
; PLAN: r0=396(x1), r1=75(y1), r2=240(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 75
LDI r2, 240
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
