; DESCRIPTION: Renders a red line between points (176, 179) and (86, 245).
; PLAN: r0=176(x1), r1=179(y1), r2=86(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 179
LDI r2, 86
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
