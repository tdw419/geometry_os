; DESCRIPTION: Renders a black line between points (97, 240) and (47, 129).
; PLAN: r0=97(x1), r1=240(y1), r2=47(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 240
LDI r2, 47
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
