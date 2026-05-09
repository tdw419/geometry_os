; DESCRIPTION: Composite: Draws a green circle centered at (341, 110) with radius 52 then Sets a single black pixel at (200, 189) then Draws a purple rectangle at (218, 138) with width 112 and height 101.
; PLAN: r0=341(x), r1=110(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x), r6=189(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=218(x), r11=138(y), r12=112(width), r13=101(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 110
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 189
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 218
LDI r11, 138
LDI r12, 112
LDI r13, 101
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
