; DESCRIPTION: Renders a red line between points (116, 240) and (192, 24).
; PLAN: r0=116(x1), r1=240(y1), r2=192(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 240
LDI r2, 192
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
