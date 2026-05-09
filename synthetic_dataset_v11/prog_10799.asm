; DESCRIPTION: Renders a red line between points (179, 169) and (237, 109).
; PLAN: r0=179(x1), r1=169(y1), r2=237(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 169
LDI r2, 237
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
