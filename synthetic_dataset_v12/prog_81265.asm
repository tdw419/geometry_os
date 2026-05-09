; DESCRIPTION: Renders a white line between points (506, 246) and (58, 179).
; PLAN: r0=506(x1), r1=246(y1), r2=58(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 246
LDI r2, 58
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
