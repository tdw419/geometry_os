; DESCRIPTION: Composite: Sets a single blue pixel at (220, 147) then Creates a yellow rectangular region at (302, 154) spanning 19 by 92 pixels then Creates a red circular shape at (43, 126) with radius 18.
; PLAN: r0=220(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=154(y), r7=19(width), r8=92(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=43(x), r11=126(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 147
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 154
LDI r7, 19
LDI r8, 92
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 126
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
