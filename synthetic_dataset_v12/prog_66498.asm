; DESCRIPTION: Composite: Draws a yellow circle centered at (258, 152) with radius 12 then Renders a yellow line between points (432, 101) and (216, 245).
; PLAN: r0=258(x), r1=152(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x1), r6=101(y1), r7=216(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 152
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 101
LDI r7, 216
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
