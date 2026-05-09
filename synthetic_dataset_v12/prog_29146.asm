; DESCRIPTION: Composite: Renders a yellow box of size 17x30 starting at (62, 65) then Places a yellow dot at position (412, 94) then Draws a yellow circle centered at (92, 234) with radius 20.
; PLAN: r0=62(x), r1=65(y), r2=17(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=94(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=234(y), r12=20(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 65
LDI r2, 17
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 94
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 92
LDI r11, 234
LDI r12, 20
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
