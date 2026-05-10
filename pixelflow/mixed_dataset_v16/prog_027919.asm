; DESCRIPTION: Composite: Renders a red disk with center (242, 170) and radius 58 then Renders a purple line between points (361, 169) and (378, 173).
; PLAN: r0=242(x), r1=170(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x1), r6=169(y1), r7=378(x2), r8=173(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 170
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 169
LDI r7, 378
LDI r8, 173
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
