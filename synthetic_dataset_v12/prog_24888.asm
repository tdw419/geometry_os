; DESCRIPTION: Composite: Renders a purple line between points (241, 77) and (136, 243) then Places a purple circle of radius 34 at center (463, 91).
; PLAN: r0=241(x1), r1=77(y1), r2=136(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=91(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 241
LDI r1, 77
LDI r2, 136
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 91
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
