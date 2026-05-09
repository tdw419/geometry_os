; DESCRIPTION: Renders a yellow line between points (415, 157) and (116, 18).
; PLAN: r0=415(x1), r1=157(y1), r2=116(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 157
LDI r2, 116
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
