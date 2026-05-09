; DESCRIPTION: Renders a magenta line between points (192, 101) and (17, 169).
; PLAN: r0=192(x1), r1=101(y1), r2=17(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 101
LDI r2, 17
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
