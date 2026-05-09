; DESCRIPTION: Composite: Renders a yellow box of size 35x45 starting at (255, 17) then Places a purple dot at position (86, 216) then Creates a white circular shape at (101, 96) with radius 71.
; PLAN: r0=255(x), r1=17(y), r2=35(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=216(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=96(y), r12=71(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 17
LDI r2, 35
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 216
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 101
LDI r11, 96
LDI r12, 71
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
