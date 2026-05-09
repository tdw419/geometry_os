; DESCRIPTION: Renders a black line between points (226, 130) and (47, 99).
; PLAN: r0=226(x1), r1=130(y1), r2=47(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 130
LDI r2, 47
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
