; DESCRIPTION: Renders a red line between points (280, 62) and (312, 158).
; PLAN: r0=280(x1), r1=62(y1), r2=312(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 62
LDI r2, 312
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
