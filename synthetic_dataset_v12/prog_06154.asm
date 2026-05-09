; DESCRIPTION: Renders a red line between points (379, 241) and (444, 120).
; PLAN: r0=379(x1), r1=241(y1), r2=444(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 241
LDI r2, 444
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
