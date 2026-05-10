; DESCRIPTION: Draws a red line from (341, 96) to (233, 192).
; PLAN: r0=341(x1), r1=96(y1), r2=233(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 96
LDI r2, 233
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
