; DESCRIPTION: Composite: Draws a purple circle centered at (53, 94) with radius 33 then Sets a single blue pixel at (24, 225) then Renders a yellow box of size 29x19 starting at (405, 48).
; PLAN: r0=53(x), r1=94(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=225(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=405(x), r11=48(y), r12=29(width), r13=19(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 94
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 225
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 405
LDI r11, 48
LDI r12, 29
LDI r13, 19
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
