; DESCRIPTION: Composite: Draws a green rectangle at (159, 115) with width 102 and height 119 then Sets a single magenta pixel at (359, 200) then Draws a magenta circle centered at (239, 191) with radius 62.
; PLAN: r0=159(x), r1=115(y), r2=102(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=200(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=239(x), r11=191(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 159
LDI r1, 115
LDI r2, 102
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 200
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 239
LDI r11, 191
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
