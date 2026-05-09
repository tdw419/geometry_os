; DESCRIPTION: Composite: Draws a green circle centered at (346, 158) with radius 23 then Places a yellow line segment connecting (311, 252) to (157, 242).
; PLAN: r0=346(x), r1=158(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x1), r6=252(y1), r7=157(x2), r8=242(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 158
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 252
LDI r7, 157
LDI r8, 242
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
