; DESCRIPTION: Renders a yellow line between points (194, 97) and (118, 167).
; PLAN: r0=194(x1), r1=97(y1), r2=118(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 97
LDI r2, 118
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
