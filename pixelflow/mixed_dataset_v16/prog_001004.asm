; DESCRIPTION: Composite: Renders a blue box of size 65x65 starting at (278, 114) then Places a black circle of radius 78 at center (296, 157) then Sets a single purple pixel at (326, 78).
; PLAN: r0=278(x), r1=114(y), r2=65(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x), r6=157(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=326(x), r11=78(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 278
LDI r1, 114
LDI r2, 65
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 157
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 326
LDI r11, 78
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
