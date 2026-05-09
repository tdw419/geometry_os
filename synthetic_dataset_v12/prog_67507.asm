; DESCRIPTION: Composite: Creates a yellow circular shape at (167, 85) with radius 24 then Draws a green line from (165, 216) to (163, 147).
; PLAN: r0=167(x), r1=85(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x1), r6=216(y1), r7=163(x2), r8=147(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 85
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 216
LDI r7, 163
LDI r8, 147
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
