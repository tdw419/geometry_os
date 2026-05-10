; DESCRIPTION: Renders a red line between points (341, 84) and (189, 20).
; PLAN: r0=341(x1), r1=84(y1), r2=189(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 84
LDI r2, 189
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
