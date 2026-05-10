; DESCRIPTION: Renders a black line between points (269, 183) and (229, 179).
; PLAN: r0=269(x1), r1=183(y1), r2=229(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 183
LDI r2, 229
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
