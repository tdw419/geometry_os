; DESCRIPTION: Renders a yellow line between points (40, 151) and (246, 130).
; PLAN: r0=40(x1), r1=151(y1), r2=246(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 151
LDI r2, 246
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
