; DESCRIPTION: Composite: Creates a black circular shape at (155, 136) with radius 71 then Places a magenta line segment connecting (56, 169) to (289, 188).
; PLAN: r0=155(x), r1=136(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x1), r6=169(y1), r7=289(x2), r8=188(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 136
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 169
LDI r7, 289
LDI r8, 188
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
