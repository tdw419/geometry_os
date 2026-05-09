; DESCRIPTION: Renders a yellow line between points (116, 152) and (136, 101).
; PLAN: r0=116(x1), r1=152(y1), r2=136(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 152
LDI r2, 136
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
