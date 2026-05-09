; DESCRIPTION: Renders a yellow line between points (274, 24) and (195, 89).
; PLAN: r0=274(x1), r1=24(y1), r2=195(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 24
LDI r2, 195
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
