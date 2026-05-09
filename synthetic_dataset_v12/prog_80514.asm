; DESCRIPTION: Renders a yellow line between points (144, 55) and (116, 73).
; PLAN: r0=144(x1), r1=55(y1), r2=116(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 55
LDI r2, 116
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
