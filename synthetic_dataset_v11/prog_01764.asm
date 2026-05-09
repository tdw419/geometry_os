; DESCRIPTION: Renders a red line between points (118, 154) and (204, 116).
; PLAN: r0=118(x1), r1=154(y1), r2=204(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 154
LDI r2, 204
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
