; DESCRIPTION: Renders a black line between points (88, 34) and (246, 0).
; PLAN: r0=88(x1), r1=34(y1), r2=246(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 34
LDI r2, 246
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
