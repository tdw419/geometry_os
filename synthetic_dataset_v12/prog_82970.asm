; DESCRIPTION: Renders a red line between points (137, 192) and (289, 179).
; PLAN: r0=137(x1), r1=192(y1), r2=289(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 192
LDI r2, 289
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
