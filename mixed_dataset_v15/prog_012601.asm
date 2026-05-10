; DESCRIPTION: Renders a white line between points (93, 56) and (136, 116).
; PLAN: r0=93(x1), r1=56(y1), r2=136(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 56
LDI r2, 136
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
