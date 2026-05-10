; DESCRIPTION: Composite: Sets a single blue pixel at (230, 154) then Renders a green disk with center (181, 91) and radius 68 then Places a yellow line segment connecting (378, 183) to (10, 224).
; PLAN: r0=230(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=91(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x1), r11=183(y1), r12=10(x2), r13=224(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 91
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 183
LDI r12, 10
LDI r13, 224
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
