; DESCRIPTION: Renders a red line between points (379, 253) and (222, 109).
; PLAN: r0=379(x1), r1=253(y1), r2=222(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 253
LDI r2, 222
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
