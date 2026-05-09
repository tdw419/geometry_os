; DESCRIPTION: Composite: Draws a yellow circle centered at (179, 88) with radius 62 then Renders a yellow line between points (418, 156) and (176, 114).
; PLAN: r0=179(x), r1=88(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x1), r6=156(y1), r7=176(x2), r8=114(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 88
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 156
LDI r7, 176
LDI r8, 114
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
