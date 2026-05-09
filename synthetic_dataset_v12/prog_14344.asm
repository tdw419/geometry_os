; DESCRIPTION: Renders a yellow line between points (192, 71) and (496, 118).
; PLAN: r0=192(x1), r1=71(y1), r2=496(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 71
LDI r2, 496
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
