; DESCRIPTION: Renders a black line between points (181, 32) and (246, 17).
; PLAN: r0=181(x1), r1=32(y1), r2=246(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 32
LDI r2, 246
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
