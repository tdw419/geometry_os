; DESCRIPTION: Renders a yellow line between points (459, 165) and (351, 118).
; PLAN: r0=459(x1), r1=165(y1), r2=351(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 165
LDI r2, 351
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
