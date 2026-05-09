; DESCRIPTION: Renders a black line between points (221, 246) and (116, 30).
; PLAN: r0=221(x1), r1=246(y1), r2=116(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 246
LDI r2, 116
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
