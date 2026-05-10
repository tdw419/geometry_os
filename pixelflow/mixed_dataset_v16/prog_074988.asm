; DESCRIPTION: Composite: Renders a yellow box of size 53x43 starting at (224, 17) then Places a black line segment connecting (215, 178) to (498, 187) then Creates a magenta circular shape at (274, 115) with radius 69.
; PLAN: r0=224(x), r1=17(y), r2=53(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x1), r6=178(y1), r7=498(x2), r8=187(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=115(y), r12=69(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 224
LDI r1, 17
LDI r2, 53
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 178
LDI r7, 498
LDI r8, 187
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 115
LDI r12, 69
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
