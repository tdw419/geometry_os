; DESCRIPTION: Composite: Draws a purple circle centered at (141, 160) with radius 46 then Creates a yellow rectangular region at (274, 60) spanning 26 by 63 pixels then Sets a single blue pixel at (121, 198).
; PLAN: r0=141(x), r1=160(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=60(y), r7=26(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=121(x), r11=198(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 160
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 60
LDI r7, 26
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 198
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
