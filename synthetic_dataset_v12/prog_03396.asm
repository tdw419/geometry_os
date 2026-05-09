; DESCRIPTION: Composite: Creates a blue circular shape at (319, 61) with radius 48 then Sets a single black pixel at (191, 183) then Creates a red rectangular region at (359, 50) spanning 94 by 99 pixels.
; PLAN: r0=319(x), r1=61(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=183(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=359(x), r11=50(y), r12=94(width), r13=99(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 61
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 183
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 359
LDI r11, 50
LDI r12, 94
LDI r13, 99
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
