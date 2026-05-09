; DESCRIPTION: Renders a yellow line between points (116, 139) and (124, 189).
; PLAN: r0=116(x1), r1=139(y1), r2=124(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 139
LDI r2, 124
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
