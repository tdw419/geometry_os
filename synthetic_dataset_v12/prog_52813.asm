; DESCRIPTION: Renders a black line between points (246, 240) and (471, 105).
; PLAN: r0=246(x1), r1=240(y1), r2=471(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 240
LDI r2, 471
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
