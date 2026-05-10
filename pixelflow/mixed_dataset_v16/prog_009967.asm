; DESCRIPTION: Renders a red line between points (179, 177) and (447, 183).
; PLAN: r0=179(x1), r1=177(y1), r2=447(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 177
LDI r2, 447
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
