; DESCRIPTION: Composite: Draws a purple circle centered at (43, 48) with radius 30 then Sets a single white pixel at (120, 17) then Places a green 78x111 rectangle at position (312, 46).
; PLAN: r0=43(x), r1=48(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=17(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=312(x), r11=46(y), r12=78(width), r13=111(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 48
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 17
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 312
LDI r11, 46
LDI r12, 78
LDI r13, 111
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
