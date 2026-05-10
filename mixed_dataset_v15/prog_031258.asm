; DESCRIPTION: Composite: Places a purple 17x48 rectangle at position (333, 175) then Creates a black circular shape at (35, 49) with radius 14.
; PLAN: r0=333(x), r1=175(y), r2=17(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=49(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 333
LDI r1, 175
LDI r2, 17
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 49
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
