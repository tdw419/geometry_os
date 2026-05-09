; DESCRIPTION: Renders a red line between points (163, 120) and (245, 116).
; PLAN: r0=163(x1), r1=120(y1), r2=245(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 120
LDI r2, 245
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
