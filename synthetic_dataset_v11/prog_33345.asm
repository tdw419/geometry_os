; DESCRIPTION: Renders a white line between points (147, 183) and (179, 230).
; PLAN: r0=147(x1), r1=183(y1), r2=179(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 183
LDI r2, 179
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
