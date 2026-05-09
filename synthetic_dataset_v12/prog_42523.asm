; DESCRIPTION: Composite: Draws a black circle centered at (233, 208) with radius 44 then Renders a magenta line between points (316, 227) and (477, 176).
; PLAN: r0=233(x), r1=208(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x1), r6=227(y1), r7=477(x2), r8=176(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 208
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 227
LDI r7, 477
LDI r8, 176
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
