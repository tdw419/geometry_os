; DESCRIPTION: Renders a black line between points (268, 136) and (246, 80).
; PLAN: r0=268(x1), r1=136(y1), r2=246(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 136
LDI r2, 246
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
