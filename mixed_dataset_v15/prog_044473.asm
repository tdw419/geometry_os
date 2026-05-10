; DESCRIPTION: Renders a yellow line between points (194, 167) and (43, 25).
; PLAN: r0=194(x1), r1=167(y1), r2=43(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 167
LDI r2, 43
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
