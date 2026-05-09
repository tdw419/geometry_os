; DESCRIPTION: Renders a black line between points (136, 60) and (8, 23).
; PLAN: r0=136(x1), r1=60(y1), r2=8(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 60
LDI r2, 8
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
