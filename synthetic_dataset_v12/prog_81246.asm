; DESCRIPTION: Renders a red line between points (30, 168) and (472, 245).
; PLAN: r0=30(x1), r1=168(y1), r2=472(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 168
LDI r2, 472
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
